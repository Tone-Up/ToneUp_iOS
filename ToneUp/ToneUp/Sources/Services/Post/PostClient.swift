//
//  PostClient.swift
//  ToneUp
//
//  Created by 전준영 on 7/9/25.
//

import Foundation
import Dependencies

struct PostClient {
    var feed: (_ images: [Data], _ content: String) async throws -> PostDTO
}

enum PostClientKey: DependencyKey {
    static let liveValue: PostClient = PostClient(
        feed: { images, content in
            @Dependency(\.imageURLClient) var imageClient
            let fileNames = images.enumerated().map { "\($0.offset + 1)" }
            let dto = try await imageClient.postURLImage(fileNames)
            
            let presignedUrls = dto.files.map { $0.uploadUrl }
            let fileUrls = dto.files.map { $0.fileUrl }
            
            for (url, data) in zip(presignedUrls, images) {
                try await imageClient.putURLImage(url, data)
            }
            
            let provider = NetworkProvider<FeedAPI>()
            let body = PostRequestBody(title: nil,
                                       content: content,
                                       imageUrls: fileUrls)
            let response = try await provider.request(
                .postFeed(body: body),
                decodingType: PostDTO.self
            )
            
            return response
        }
    )
}

extension DependencyValues {
    var postClient: PostClient {
        get { self[PostClientKey.self] }
        set { self[PostClientKey.self] = newValue }
    }
}
