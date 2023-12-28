//
//  HTTPDataDownloader.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 20/12/2023.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw CoinAPIError.requestFailed(description: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinAPIError.requestFailed(description: "Request failed")
        }
        guard httpResponse.statusCode == 200 else {
            throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("DEBUG: Error \(error)")
            throw error as? CoinAPIError ?? CoinAPIError.unknownError(error: error)
        }
    }
}
