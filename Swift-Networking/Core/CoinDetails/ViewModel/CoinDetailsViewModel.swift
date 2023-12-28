//
//  CoinDetailsViewModel.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 20/12/2023.
//

import Foundation


class CoinDetailsViewModel: ObservableObject {
    
    private let service: CoinServiceProtocol
    private let coinId: String
    @Published var coinDetails: CoinDetails?
    
    init(coinId: String, service: CoinServiceProtocol) {
        self.service = service
        self.coinId = coinId
//        Task { await fetchCoinDetails() }
    }
    
    
    @MainActor
    func fetchCoinDetails() async {
//        print("Fetching coins")
//        try? await Task.sleep(nanoseconds: 2_000_000_000)
//        print("Task woke up")
        
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
            
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
