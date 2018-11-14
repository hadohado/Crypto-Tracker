//
//  CoinData.swift
//  Crypto Tracker
//
//  Created by ha tuong do on 11/12/18.
//  Copyright © 2018 alpine. All rights reserved.
//

import UIKit
import Alamofire // import Foundation


// create singleton class (only 1 instance of this class is created)
class CoinData {
    // need 2 lines static ... andn private init() ... to make a singleton
    static let shared = CoinData()
    var coins = [Coin]()
    weak var delegate : CoinDataDelegate? // make new property "delegate" of type CoinData..
    // weak so that we dont have memory problem
    
    private init() { // init() will customize our obj when we creaate instance of it
        // list of crypto currencies we want to display
        let symbols = ["BTC", "ETH", "LTC"]
        for symbol in symbols {
            let coin = Coin(symbol: symbol)
            coins.append(coin)
        }
    }
    
    func getPrices() {
        var listOfSymbols = ""
        for coin in coins {
            listOfSymbols += coin.symbol
            if coin.symbol != coins.last?.symbol {
                listOfSymbols += ","
            }
        }
        Alamofire.request("https://min-api.cryptocompare.com/data/pricemulti?fsyms=\(listOfSymbols)&tsyms=USD").responseJSON { (responseObject) in
            
            // ..value is a dictionary with String as key and Any as value
            // can not loop through a dictionary (but we can loop through an array
            if let json = responseObject.result.value as? [String: Any] {
                for coin in self.coins {
                    if let coinJSON = json[coin.symbol] as? [String:Double] {
                        if let price = coinJSON["USD"] {
                            coin.price = price
                        }
                    }
                }
                self.delegate?.newPrices?()
            }
            // print(responseObject.result.value ?? <#default value#>)
            // 1st dictionary {BTC = __ ; ETH = __ ; LTC = __ }
            // inside 1st dictionary are 3 sub dictionaries { USD = __ } ...
            //
            // Optional({
            //    BTC =     { USD = "6358.6"; };
            //    ETH =     { USD = "206.81"; };
            //    LTC =     { USD = "49.65";  };
            // })
 
        }
        
        /*
        Alamofire.request("https://min-api.cryptocompare.com/data/pricemulti?fsyms=\(listOfSymbols)&tsyms=USD").responseJSON { (<#DataResponse<Any>#>) in
            <#code#>
        } */
    }
}

@objc protocol CoinDataDelegate : class { // need @objc so that we can define an optional for newPrices()
    @objc optional func newPrices()
}

// protocol CoinDataDelegate  {
    // <#requirements#>
// }

class Coin {
    var symbol = ""
    var image = UIImage()
    var price = 0.0
    var amount = 0.0 // number of coins a person owns
    var historicalData = [Double]() // 30-day data
    init(symbol: String) {
        self.symbol = symbol
        if let newimage = UIImage(named: symbol) {
            self.image = newimage
        }
    }
    
    func priceAsString() -> String {
        if price == 0.0 {
            return "Loading..."
        }
        let formater = NumberFormatter()
        formater.locale = Locale.init(identifier: "en_US")
        formater.numberStyle = .currency
        if let fancyPrice = formater.string(from: NSNumber(floatLiteral: price) ) {
            return fancyPrice
        }
        else {
            return "ERROR"
        }
    }
}
