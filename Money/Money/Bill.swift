//
//  Euro.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct Bill {
    
    var _amount: Value
    var _currency: Currency
    
    init(){
        _amount = 0
        _currency = "EUR"
    }
    
}

extension Bill: MoneyProtocol {
    
    init(amount: Value, currency: Currency = "EUR"){
        _amount = amount
        _currency = currency
    }
    
    func times(_ c :Int) -> Bill{
        return Bill(amount: c * _amount, currency: _currency)
    }
    
    func plus(_ money: Bill) -> Bill{
        return Bill(amount: money._amount + _amount, currency: _currency)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill{
        let exchange = Exchange(from: _currency, to: to)
        let rate = try! broker.rate(exchange: exchange)
        return Bill(amount: _amount * rate, currency: to)
    }
    
}

extension Bill: Hashable {
    var hashValue: Value {
        return _amount.hashValue
    }
}

extension Bill: Equatable {
    static func ==(lhs: Bill, rhs: Bill) -> Bool {
        return lhs._amount == rhs._amount
    }
}

extension Bill: CustomStringConvertible {
    var description: String {
        return "\(_amount) \(_currency)"
    }
}
