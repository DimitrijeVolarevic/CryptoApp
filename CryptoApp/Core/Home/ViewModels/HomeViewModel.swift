//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 8.4.23..
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistic] = []
    
    @Published var searchText: String = ""
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
        
            .sink { [ weak self ] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates marketData
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        // updates portfolioCoins
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { coinModels, portfolioEntities -> [Coin] in
                
                coinModels
                    .compactMap { coin -> Coin? in
                        guard let entiity = portfolioEntities.first(where: {$0.coinID == coin.id}) else {
                            return nil
                            
                        }
                        return coin.updateHoldings(amount: entiity.amount)
                    }
            }
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: Coin, amount: Double) {
        portfolioDataService.updatePortfoio(coin: coin, amount: amount)
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
    
    private func mapGlobalMarketData(marketData: MarketData?) -> [Statistic] {
        
        var stats: [Statistic] = []
        
        guard let data = marketData else {
            return stats
        }
        
        let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistic(title: "24h Volume", value: data.volume)
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        let portfolioValue = Statistic(title: "Portfolio value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolioValue
        ])
        return stats
    }
}
