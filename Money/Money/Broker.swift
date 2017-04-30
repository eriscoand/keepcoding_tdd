//
//  Broker.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct Broker: Rater{
    
    var _rates = RatesDictionary()
    
    private func key(from: Currency, to: Currency) -> String{
        return "\(from)-\(to)"
    }
    
    mutating func addRate(exchange: Exchange, rate: Rate){
        
        //Direct
        _rates[key(from: exchange.from, to: exchange.to)] = rate;
        _rates[key(from: exchange.from, to: exchange.from)] = 1;
        _rates[key(from: exchange.to, to: exchange.to)] = 1;
        
        //Inverse
        if rate != 0 {
            _rates[key(from: exchange.to, to: exchange.from)] = rate;
        }

    }
    
    func rate(exchange: Exchange) throws -> Rate {
        guard let rate = _rates[key(from: exchange.from, to: exchange.to)] else{
            throw BrokerErrors.unknownRate
        }
        return rate
    }
    
}
