//
//  Euro.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct Money {
    
    var _amount: Int
    var _currency: Currency
    
    init(){
        _amount = 0
        _currency = "€"
    }
    
    init(amount: Int, currency: Currency = "€"){
        _amount = amount
        _currency = currency
    }
    
    func times(_ c :Int) -> Money{
        return Money(amount: c * _amount, currency: _currency)
    }
    
    func plus(_ money: Money) -> Money{
        return Money(amount: money._amount + _amount, currency: _currency)
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Money{
        return Money(amount: _amount, currency: to)
    }
    
}

extension Money: Hashable {
    var hashValue: Int {
        return _amount.hashValue
    }
}

extension Money: Equatable {
    static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs._amount == rhs._amount
    }
}

extension Money: CustomStringConvertible {
    var description: String {
        return "\(_amount) \(_currency)"
    }
}
