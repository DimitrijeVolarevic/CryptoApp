// CoinGecko API info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 
 JSON Response:
 {
 {
   "id": "bitcoin",
   "symbol": "btc",
   "name": "Bitcoin",
   "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
   "current_price": 30163,
   "market_cap": 584069410312,
   "market_cap_rank": 1,
   "fully_diluted_valuation": 634089860728,
   "total_volume": 20075908657,
   "high_24h": 30397,
   "low_24h": 29072,
   "price_change_24h": 941.56,
   "price_change_percentage_24h": 3.22216,
   "market_cap_change_24h": 19348461569,
   "market_cap_change_percentage_24h": 3.4262,
   "circulating_supply": 19343406,
   "total_supply": 21000000,
   "max_supply": 21000000,
   "ath": 69045,
   "ath_change_percentage": -56.35717,
   "ath_date": "2021-11-10T14:24:11.849Z",
   "atl": 67.81,
   "atl_change_percentage": 44338.18761,
   "atl_date": "2013-07-06T00:00:00.000Z",
   "roi": null,
   "last_updated": "2023-04-11T17:34:54.262Z",
   "sparkline_in_7d": {
     "price": [
       28305.012139287173,
       28280.005005551244,
     ]
   },
   "price_change_percentage_24h_in_currency": 3.222164889304092
 }
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 30136,
     "market_cap": 582923928362,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 632847096151,
     "total_volume": 20410643131,
     "high_24h": 30397,
     "low_24h": 29072,
     "price_change_24h": 975.92,
     "price_change_percentage_24h": 3.34677,
     "market_cap_change_24h": 19857461741,
     "market_cap_change_percentage_24h": 3.52666,
     "circulating_supply": 19343381,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -56.30041,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 44395.98067,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2023-04-11T17:17:54.323Z",
     "sparkline_in_7d": {
       "price": [
         28305.012139287173,
         28280.005005551244,
       ]
     },
     "price_change_percentage_24h_in_currency": 3.3467667708497504
   },
 */

import Foundation

// MARK: - Welcome
struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
                case id, symbol, name, image
                case currentPrice = "current_price"
                case marketCap = "market_cap"
                case marketCapRank = "market_cap_rank"
                case fullyDilutedValuation = "fully_diluted_valuation"
                case totalVolume = "total_volume"
                case high24H = "high_24h"
                case low24H = "low_24h"
                case priceChange24H = "price_change_24h"
                case priceChangePercentage24H = "price_change_percentage_24h"
                case marketCapChange24H = "market_cap_change_24h"
                case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
                case circulatingSupply = "circulating_supply"
                case totalSupply = "total_supply"
                case maxSupply = "max_supply"
                case ath
                case athChangePercentage = "ath_change_percentage"
                case athDate = "ath_date"
                case atl
                case atlChangePercentage = "atl_change_percentage"
                case atlDate = "atl_date"
                case lastUpdated = "last_updated"
                case sparklineIn7D = "sparkline_in_7d"
                case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
                case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
            return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
        }
    
        var currentHoldingsValue: Double {
            return (currentHoldings ?? 0) * currentPrice
        }
    
        var rank: Int {
            return Int(marketCapRank ?? 0)
        }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
