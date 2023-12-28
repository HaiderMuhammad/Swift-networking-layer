//
//  CoinAPIError.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 19/12/2023.
//

import Foundation


enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
            
        case .jsonParsingFailure: return "Failed to pare JSON"
            
        case .requestFailed(let description): return "Request Failed: \(description)"
            
        case .invalidStatusCode(let statusCode): return "Invalid status code: \(statusCode)"

        case .unknownError(let error): return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
