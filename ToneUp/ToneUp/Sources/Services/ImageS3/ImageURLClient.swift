//
//  ImageURLClient.swift
//  ToneUp
//
//  Created by 전준영 on 7/9/25.
//

import Foundation
import Dependencies
import Moya

struct ImageURLClient {
    var postURLImage: (_ imageName: [String]) async throws -> ImageDTO
    var putURLImage: (_ url: String, _ image: Data) async throws -> Void
}

enum ImageURLClientKey: DependencyKey {
    static let liveValue: ImageURLClient = ImageURLClient(
        postURLImage: { imageNames in
            let provider = NetworkProvider<ImageAPI>()
            let body = ImageRequestBody(fileNames: imageNames)
            let response = try await provider.request(
                .postImageURL(body: body),
                decodingType: ImageDTO.self
            )
            return response
        },
        putURLImage: { url, image in
            
            let s3Provider = MoyaProvider<ImageAPI>(
                plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
            )
            
            _ = try await s3Provider.requestAsync(
                .putImageURL(url: url, image: image)
            )
        }
    )
}

extension DependencyValues {
    var imageURLClient: ImageURLClient {
        get { self[ImageURLClientKey.self] }
        set { self[ImageURLClientKey.self] = newValue }
    }
}
