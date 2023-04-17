import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    let stat1 = Statistic(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = Statistic(title: "Total Volume", value: "$1.23Tr")
    let stat3 = Statistic(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    
    let coin = Coin(
       id: "bitcoin",
       symbol: "btc",
       name: "Bitcoin",
       image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
       currentPrice: 29936,
       marketCap: 579114021606,
       marketCapRank: 1,
       fullyDilutedValuation: 628545179011,
       totalVolume: 13378954614,
       high24H: 30535,
       low24H: 29826,
       priceChange24H: -409.5012001034884,
       priceChangePercentage24H: -1.34947,
       marketCapChange24H: -7968662610.626221,
       marketCapChangePercentage24H: -1.35733,
       circulatingSupply: 19348481,
       totalSupply: 21000000,
       maxSupply: 21000000,
       ath: 69045,
       athChangePercentage: -56.653,
       athDate: "2021-11-10T14:24:11.849Z",
       atl: 67.81,
       atlChangePercentage: 44036.96955,
       atlDate: "2013-07-06T00:00:00.000Z",
       lastUpdated: "2023-04-17T07:17:36.632Z",
       sparklineIn7D: SparklineIn7D(price: [
                28265.89113654399,
                28330.260698422673,
                28286.68490746672,
                28325.876622886393,
                28314.22212848336,
                28353.153747104603,
                28338.6015267827,
                28311.419417825244,
                28237.656754593812,
                28327.42664382811,
                28445.47931184444,
                29010.673974693666,
                29183.936016649466,
                29248.140785440086,
                29214.56004985123,
                29120.88823842065,
                29239.621692579498,
                29674.284153034765,
                29657.974136873556,
                29859.870008976173,
                30026.697062948497,
                30130.322222748313,
                30081.856224726234,
                30131.19620727577,
                29989.041422111706,
                30076.928321255735,
                30138.30286213903,
                30105.474319243684,
                30068.0734128783,
                30180.563919558186,
                30086.869187355376,
                30132.849745117488,
                30177.803914347918,
                30087.98340923416,
                30214.307177573563,
                30225.920267562975,
                30216.915656286754,
                30250.83260478154,
                30138.51321654413,
                30189.355047986835,
                30239.035844019814,
                30294.285119109303,
                30260.93610940865,
                30269.973830348576,
                30204.811594353832,
                29909.185993786305,
                29970.97676179108,
                30008.852839499283,
                29951.279758798635,
                29963.20279931688,
                30017.553260048844,
                29983.94700385204,
                30020.615187465235,
                30040.879680443755,
                30009.59523399315,
                30309.229461843606,
                30146.653274178367,
                30085.792748498076,
                29998.616956197235,
                30005.712386899886,
                30052.210277811,
                29952.98133128504,
                29843.932781486215,
                29932.013479928974,
                29975.04418074401,
                29870.157595388468,
                29904.138694718906,
                30011.901108206832,
                30095.475084565176,
                30185.335024821372,
                30122.825087291447,
                30089.239027792402,
                30141.054665596494,
                30074.536347775804,
                30134.41551515664,
                30280.04477351826,
                30224.870534985745,
                30256.914070898354,
                30227.14865185976,
                30257.593771373624,
                30249.85775138363,
                30478.810893342754,
                30471.019586216564,
                30379.612431786805,
                30444.20960062811,
                30504.03307604751,
                30381.395581867884,
                30321.270286202234,
                30335.400568659956,
                30365.009894667674,
                30405.027312781145,
                30786.788062432508,
                30817.50292487932,
                30623.953513729135,
                30758.90316262121,
                30722.55412769001,
                30838.571381300117,
                30979.316176522065,
                30899.763311406896,
                30729.461065670013,
                30812.019661456827,
                30799.371487215336,
                30849.0416601834,
                30755.118587886707,
                30735.85472723783,
                30599.102095243234,
                30265.459963764697,
                30178.16669642992,
                30273.13202581789,
                30326.58635947574,
                30346.06451398831,
                30465.662005585073,
                30519.90819557164,
                30472.95177939664,
                30468.40870059078,
                30496.189040198205,
                30442.109010211523,
                30395.958541648113,
                30415.867992100597,
                30406.19727298208,
                30445.44992605262,
                30420.812282670242,
                30455.13158888356,
                30422.11202645143,
                30486.486566920375,
                30452.74919352091,
                30433.557983799743,
                30477.740746569576,
                30403.76952935211,
                30434.50031081011,
                30386.825633108332,
                30336.638776779033,
                30291.87234137624,
                30336.787196278976,
                30352.351793708633,
                30329.930282653193,
                30318.43906214953,
                30374.27426940806,
                30312.16187965924,
                30344.89623493918,
                30271.483362243598,
                30300.83650735637,
                30268.800598138845,
                30340.949577529478,
                30331.449817114986,
                30338.80666574067,
                30418.60197032407,
                30372.504061783817,
                30309.0548575341,
                30317.63079452585,
                30245.025794681376,
                30288.947971853395,
                30263.20231021612,
                30350.511194031453,
                30394.431725421273,
                30347.43884485818,
                30324.37796363114,
                30350.004984073377,
                30456.559574253242,
                30391.890984643345,
                30387.9846750236,
                30344.414207244645,
                30304.807514785844,
                29837.57001418961,
                29960.287179013692,
                30058.437215285838,
                29993.929469003833,
                29996.379024562757

       ]),
       priceChangePercentage24HInCurrency: -1.3494685697162496,
       currentHoldings: 1.5)
    
}

