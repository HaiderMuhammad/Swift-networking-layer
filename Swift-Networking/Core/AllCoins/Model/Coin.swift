//
//  Coin.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 19/12/2023.
//

import Foundation

struct Coin: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
    let marketCapRank: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol
        case currentPrice  = "current_price"
        case marketCapRank = "market_cap_rank"
    }
}
