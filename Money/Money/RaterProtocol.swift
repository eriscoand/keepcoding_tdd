//
//  RaterProtocol.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

protocol Rater{
    func rate(exchange: Exchange) throws -> Rate
}

extension Rater{
    func rate(exchange: Exchange) throws -> Rate{
        return 1
    }
}
