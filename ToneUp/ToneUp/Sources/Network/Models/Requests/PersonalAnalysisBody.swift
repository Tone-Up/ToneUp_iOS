//
//  PersonalAnalysisBody.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import Foundation
import Moya

struct PersonalAnalysisBody: MultipartFormDataConvertible {
    
    let uuid: UUID
    let imageData: Data
    
    init(imageData: Data) {
        self.uuid = UUID()
        self.imageData = imageData
    }
    
    func toMultipartFormData() -> [MultipartFormData] {
        var multipartData = [MultipartFormData]()
        
        multipartData.append(
            MultipartFormData(provider: .data(imageData),
                              name: "image",
                              fileName: "\(uuid).jpeg",
                              mimeType: "image/jpeg")
        )
        
        return multipartData
    }
    
}
