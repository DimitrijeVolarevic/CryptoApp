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
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
        
            .sink { [ weak self ] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercassedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercassedText) ||
                coin.symbol.lowercased().contains(lowercassedText) ||
                coin.id.lowercased().contains(lowercassedText)
        }
        
    }
}
