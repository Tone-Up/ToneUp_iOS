//
//  AccessTokenRetrier.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation
import Alamofire
import Moya

final class AccessTokenRetrier: RequestInterceptor {
    
    let retryLimit = 3
    let retryDelay: TimeInterval = 1
    
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.setValue(Header.authorization.value,
                            forHTTPHeaderField: Header.authorization.key)
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        
        guard let moyaError = error as? MoyaError,
              case let .statusCode(response) = moyaError else {
            completion(.doNotRetry)
            return
        }
        
        let data = response.data
        
        DispatchQueue.global().async {
            let shouldRetry = self.handle401RetrySync(with: data,
                                                      retryCount: request.retryCount)
            DispatchQueue.main.async {
                completion(shouldRetry ? .retryWithDelay(self.retryDelay) : .doNotRetry)
            }
        }
    }
    
    private func handle401RetrySync(with responseData: Data,
                                    retryCount: Int) -> Bool {
        if retryCount >= retryLimit {
            return false
        }
        
        guard let serverResponse = try? JSONDecoder().decode(ServerResponse<EmptyResponse>.self,
                                                             from: responseData),
              let errorCode = serverResponse.errorCode else {
            return false
        }
        
        switch errorCode {
        case "TOKEN_EXPIRED":
            let result = refreshAccessTokenSync()
            return result
            
        case "UNAUTHORIZED", "INVALID_REFRESH_TOKEN":
            // NotificationCenter.default.post(name: .logout, object: nil)
            return false
            
        default:
            return false
        }
    }
    
    private func refreshAccessTokenSync() -> Bool {
        let semaphore = DispatchSemaphore(value: 0)
        var success = false
        
        let provider = MoyaProvider<TokenAPI>()
        let body = TokenRequestBody(accessToken: KeychainManager.load(forKey: .accessToken),
                                    refreshToken: KeychainManager.load(forKey: .refreshToken),
                                    fcmToken: UserDefaultsStorage.fcmToken)
        
        provider.request(.token(body: body)) { result in
            defer { semaphore.signal() }
            
            switch result {
            case .success(let response):
                do {
                    let tokenResponse = try JSONDecoder().decode(ServerResponse<TokenDTO>.self,
                                                                 from: response.data)
                    
                    switch tokenResponse.code {
                    case 112, 113, 114:
                        // NotificationCenter.default.post(name: .logout, object: nil)
                        success = false
                        
                    default:
                        if let tokenDTO = tokenResponse.data {
                            KeychainManager.save(tokenDTO.accessToken, forKey: .accessToken)
                            KeychainManager.save(tokenDTO.refreshToken, forKey: .refreshToken)
                            success = true
                        }
                    }
                } catch {
                    success = false
                }
                
            case .failure:
                success = false
            }
        }
        
        semaphore.wait()
        return success
    }
}

struct EmptyResponse: Decodable {}
