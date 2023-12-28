//
//  CoinDetailsCache.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 20/12/2023.
//

import Foundation
 

class CoinDetailsCache {
    static let shared = CoinDetailsCache()
    
    private let cache = NSCache<NSString, NSData>()
    
    private init() { }
    
    func set(_ coinDetails: CoinDetails, forKey key: String) {
        guard let data = try? JSONEncoder().encode(coinDetails) else { return }
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> CoinDetails? {
        guard let data = cache.object(forKey: key as NSString) as? Data else { return nil }
        return try? JSONDecoder().decode(CoinDetails.self, from: data)
    }
}
