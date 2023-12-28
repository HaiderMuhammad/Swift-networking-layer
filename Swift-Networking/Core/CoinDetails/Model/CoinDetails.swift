//
//  CoinDetails.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 20/12/2023.
//

import Foundation


struct CoinDetails: Codable {
    let id :String
    let symbol: String
    let name: String
    let description: Description
    
}

struct Description: Codable {
    let text: String
    
    
    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
