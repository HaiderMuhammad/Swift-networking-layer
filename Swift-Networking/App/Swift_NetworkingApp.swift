//
//  Swift_NetworkingApp.swift
//  Swift-Networking
//
//  Created by Haider Muhammed on 19/12/2023.
//

import SwiftUI

@main
struct Swift_NetworkingApp: App {
    var body: some Scene {
        
        WindowGroup {
            ContentView(service: CoinDataService() )
        }
    }
}
