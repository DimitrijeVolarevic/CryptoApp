//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 7.4.23..
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]

    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
                    .preferredColorScheme(.dark)
            }
            .environmentObject(vm)
        }
    }
}
