//
//  ColorAnalysisClient.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import Foundation
import Dependencies

struct ColorAnalysisClient {
    var analytic: (_ image: Data) async throws -> PersonalColorDTO
}

enum ColorAnalysisClientKey: DependencyKey {
    static let liveValue: ColorAnalysisClient = ColorAnalysisClient(
        analytic: { image in
            let provider = NetworkProvider<PersonalAPI>()
            let body = PersonalAnalysisBody(imageData: image)
            let response = try await provider.request(
                .personalAnalysis(body: body),
                decodingType: ServerResponse<PersonalColorDTO>.self
            )
            
            guard let colorDTO = response.data else {
                throw ColorAnalysisError.missingData
            }
            
            return colorDTO
        }
    )
}

extension DependencyValues {
    var colorAnalysisClient: ColorAnalysisClient {
        get { self[ColorAnalysisClientKey.self] }
        set { self[ColorAnalysisClientKey.self] = newValue }
    }
}
