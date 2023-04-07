//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 7.4.23..
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
