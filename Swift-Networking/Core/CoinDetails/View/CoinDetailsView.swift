//
//  CoinDetailsView.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 20/12/2023.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    @ObservedObject var viewModel: CoinDetailsViewModel
    @State private var task: Task<(), Never>?
    
    init(coin: Coin, service: CoinServiceProtocol) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id, service: service)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                
                    Text(details.name)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    Text(details.symbol.uppercased())
                        .font(.footnote)
                    
                    Text(details.description.text)
                        .font(.footnote)
                        .padding(.vertical)
                
                Spacer()
            }
        }
        .task {
            await viewModel.fetchCoinDetails()
        }
//        .onAppear {
//            self.task = Task { await viewModel.fetchCoinDetails() }
//        }
//        .onDisappear {
//            task?.cancel()
//        }
        .padding()
    }
}

//#Preview {
//    CoinDetailsView()
//}
