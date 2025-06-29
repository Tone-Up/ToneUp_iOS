//
//  AuthError.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import Foundation

enum AuthError: Error {
    case cancelled
    case network(Error)
    case unknown
    case tokenMissing
    case unsupportedProvider
}

enum ColorAnalysisError: Error {
  case missingData
  case networkFailure(Error)
}
