//
//  NetworkProvider.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation
import Moya

final class NetworkProvider<T: TargetType> {
    
    private let provider: MoyaProvider<T>
    private let tokenRetrier = AccessTokenRetrier()
    
    init() {
        let session = Session(interceptor: tokenRetrier)
        let plugins: [PluginType] = [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
        self.provider = MoyaProvider<T>(
            session: session,
            plugins: plugins
        )
    }
    
    func request<R: Decodable>(
        _ target: T,
        decodingType: R.Type,
        retryCount: Int = 1
    ) async throws -> R {
        var attempt = 0

        while true {
            do {
                let response = try await provider.asyncRequest(target)
                let serverResponse = try response.map(ServerResponse<R>.self)
                
                return try await handleResponse(serverResponse)
            } catch {
                attempt += 1
                if attempt > retryCount {
                    throw APIErrorMapper.map(error)
                }
            }
        }
    }
    
}

extension MoyaProvider {
    func asyncRequest(_ target: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
