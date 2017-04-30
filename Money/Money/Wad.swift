//
//  Wad.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct Wad {
    var _bills = Bills()
    
    func sum() -> Value {
        return _bills.reduce(0, { (add, bill) -> Int in
            add + bill._amount
        })
    }
    
}

extension Wad : MoneyProtocol{
    
    init(amount: Value, currency: Currency = "EUR"){
        _bills.append(Bill(amount: amount, currency: currency))
    }
    
    func times(_ c:Int)->Wad{
        
        var total = Bills()
        for each in _bills {
            let b = Bill(amount: each._amount * c, currency: each._currency)
            total.append(b)
        }
        
        return Wad(_bills: total)
        
    }
    
    func plus(_ addend: Wad)-> Wad{
        return Wad(_bills: _bills + addend._bills)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill{
        
        return try _bills.reduce(Bill(amount: 0, currency: to)) { (result, bill) -> Bill in
            try result.reduced(to: to, broker: broker).plus(try bill.reduced(to: to, broker: broker))
        }
        
    }
    
}

extension Wad: Equatable {
    static func ==(lhs: Wad, rhs: Wad) -> Bool {
        // Se convierte todo a USD y se compara los valores finales
        let broker = UnityBroker()
        
        let leftBill = try! lhs.reduced(to: "USD", broker: broker)
        let rightBill = try! rhs.reduced(to: "USD", broker: broker)
        
        return leftBill == rightBill
    }
}

extension Wad: CustomStringConvertible {
    var description: String {
        if _bills.count == 0 {
            return "Empty"
        }else{
            return _bills.reduce("", { (concatenate, bill) -> String in
                concatenate + bill.description
            })
        }
    }
}





