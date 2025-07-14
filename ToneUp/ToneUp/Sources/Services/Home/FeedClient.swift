//
//  FeedClient.swift
//  ToneUp
//
//  Created by 전준영 on 7/11/25.
//

import Foundation
import Dependencies

struct FeedClient {
    var homeFeed: () async throws -> FeedDTO
}

enum FeedClientKey: DependencyKey {
    static let liveValue: FeedClient = FeedClient (
        homeFeed: {
            let provider = NetworkProvider<FeedAPI>()
            let query = QueryParameters(cursor: nil,
                                        limit: nil,
                                        sort: nil)
            let response = try await provider.request(
                .getRecentFeed(query: query),
                decodingType: FeedDTO.self
            )
            
            return response
        }
    )
}

extension DependencyValues {
    var feedClient: FeedClient {
        get { self[FeedClientKey.self] }
        set { self[FeedClientKey.self] = newValue }
    }
}
