//
//  CoinsViewModel.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 19/12/2023.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var errorMessage: String?
    @Published var coins = [Coin]()
    
    private let service: CoinServiceProtocol
    
    init(service: CoinServiceProtocol) {
        self.service = service
        Task { await fetchCoins() }
    }
    
    @MainActor
    func fetchCoins() async {
        do {
            self.coins = try await service.fetchCoins()
        } catch {
            guard let error = error as? CoinAPIError else  { return }
            self.errorMessage = error.customDescription
        }
    }
    
//    func fetchCoinsWithResult() {
//        service.fetchCoinsWithResult { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let coins):
//                    self?.coins = coins
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
}
