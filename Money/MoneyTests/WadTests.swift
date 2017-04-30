//
//  WadTests.swift
//  Money
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import XCTest
@testable import Money

class WadTests: XCTestCase {
    
    var emptyWad: Wad!
    var singleBillWad: Wad!
    
    
    override func setUp() {
        super.setUp()
        emptyWad = Wad()
        singleBillWad = Wad(amount: 42, currency: "EUR")
    }
    
    func testCanCreateWad(){
        XCTAssertNotNil(Wad())
    }
    
    func testEquality(){
        
        XCTAssertEqual(emptyWad, emptyWad)
        XCTAssertEqual(singleBillWad, singleBillWad)
        
        XCTAssertNotEqual(emptyWad, singleBillWad)
        
        let tenEuros = Wad(amount: 10, currency: "EUR")
        let tenDollars = Wad(amount: 10, currency: "USD")
        
        let fifty1 = Wad(amount: 50, currency: "USD")
        let fifty2 = Wad(amount: 10, currency: "EUR")
            .plus(tenEuros).plus(tenDollars).plus(tenDollars).plus(tenEuros)
        let fifty3 = Wad(amount: 30, currency: "EUR").plus(tenDollars).plus(tenEuros)
        
        XCTAssertEqual(fifty1, fifty2)
        XCTAssertEqual(fifty1, fifty3)
        XCTAssertEqual(fifty2, fifty3)
        
    }
    
    func testSimpleAddition(){
        
        XCTAssertEqual(singleBillWad.plus( Wad(amount: 8, currency: "USD")), Wad(amount: 50, currency: "USD"))
        
    }
    
    func testSimpleMultiplication(){
        let eightyFour = singleBillWad.times(2)
        XCTAssertEqual(eightyFour, Wad(amount: 84, currency: "USD"))
    }
    
}
