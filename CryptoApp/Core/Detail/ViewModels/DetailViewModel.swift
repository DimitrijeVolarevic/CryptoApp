//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 15.4.23..
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin:Coin) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Recieved coin detail data!")
                print(returnedCoinDetails)
                
            }
            .store(in: &cancellables)
    }
}
