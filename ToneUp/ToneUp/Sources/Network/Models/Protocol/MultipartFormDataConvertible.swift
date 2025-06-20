//
//  MultipartFormDataConvertible.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation
import Moya

protocol MultipartFormDataConvertible {
    func toMultipartFormData() -> [MultipartFormData]
}
