//
//  CoinDetailsViewModel2.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 22/12/2023.
//

import Foundation


class CoinDetailsViewModel2: ObservableObject {
    private let service: CoinDataService
    private let coinId: String
    @Published var coinDetails: CoinDetails?
    
    init(coinId: String, service: CoinDataService) {
        self.coinId = coinId
        self.service = service
    }
    
    func fetchCoinDetails() async {
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
