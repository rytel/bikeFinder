//
//  ApiError.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

final class GenericError: Error {
    let underlyingError: ErrorType
    
    init(underlyingError: ErrorType) {
        self.underlyingError = underlyingError
    }
    
    var description: String {
        underlyingError.description
    }
}

enum ErrorType: Error, CustomStringConvertible {
    case jsonDecodingFailure(error: Error)
    case unknownError(error: Error)
    
    var description: String {
        switch self {
        case .jsonDecodingFailure(let error):
            "Json Decoding Failure: \(error)"
        case .unknownError(let error):
            "Unknown error: \(error)"
        }
    }
}
