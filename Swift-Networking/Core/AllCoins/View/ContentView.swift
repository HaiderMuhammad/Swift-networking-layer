//
//  ContentView.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    private let service: CoinServiceProtocol
    @StateObject var viewModel: CoinsViewModel
    
    init(service: CoinServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: CoinsViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(value: coin) {
                        HStack(spacing: 12) {
                            Text("\(coin.marketCapRank)")
                                .foregroundStyle(.gray)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(coin.name)
                                    .fontWeight(.semibold)
                                
                                Text(coin.symbol.uppercased())
                            }
                        }
                        .font(.footnote)
                    }
                    .navigationDestination(for:  Coin.self) { coin in
                        CoinDetailsView(coin: coin, service: service)
                    }
                }
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
