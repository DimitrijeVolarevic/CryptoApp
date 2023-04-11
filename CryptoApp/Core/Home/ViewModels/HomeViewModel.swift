//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 8.4.23..
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
