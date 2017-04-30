//
//  MoneyProtocol.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

protocol MoneyProtocol {
    
    func times(_ n:Int)->Bill
    
    func plus(_ addend: Bill)-> Bill
    
    func reduced(to: Currency, broker: Broker) throws -> Bill
    
}
