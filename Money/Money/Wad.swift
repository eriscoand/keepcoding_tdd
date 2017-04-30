//
//  Wad.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct Wad{
    var _bills = Bills()
    
    var _amount: Int
    var _currency: Currency
    
    init(){
        _amount = 0
        _currency = "EUR"
    }
    
}

extension Wad : MoneyProtocol{
    
    init(amount: Int, currency: Currency = "EUR"){
        _amount = amount
        _currency = currency
    }
    
    func times(_ n:Int)->Wad{
        return self
    }
    
    func plus(_ addend: Wad)-> Wad{
        return self
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Wad{
        return self
    }
    
}
