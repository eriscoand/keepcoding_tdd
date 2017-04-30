//
//  MoneyProtocol.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

protocol MoneyProtocol {
    
    init(amount: Value, currency: Currency)
    
    func times(_ n:Int) -> Self
    
    func plus(_ addend: Self) -> Self
    
    func reduced(to: Currency, broker: Rater) throws -> Bill
    
}
