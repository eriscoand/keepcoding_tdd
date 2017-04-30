//
//  MoneyTests.swift
//  MoneyTests
//
//  Created by Eric Risco de la Torre on 30/04/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import XCTest
@testable import Money

class MoneyTests: XCTestCase {
    
    var five: Bill!
    var otherFive: Bill!
    var ten: Bill!
    var broker: Broker!
    
    override func setUp() {
        super.setUp()
        five = Bill(amount: 5)
        otherFive = Bill(amount: 5)
        ten = Bill(amount: 10)
        broker = Broker()
    }
    
    func testCanCreateEuro(){
        XCTAssertNotNil(Bill())
    }
    
    func testSimpleMultiplication(){
        let ten = five.times(2)
        XCTAssertEqual(ten._amount, 10)
    }
    
    func testEquality(){
        XCTAssertEqual(otherFive, otherFive)
        XCTAssertEqual(five, otherFive)
        
        XCTAssertNotEqual(five, ten)
    }
    
    func testThatObjectWithEqualHashAreEqual(){
        XCTAssertEqual(five.hashValue, otherFive.hashValue)
        XCTAssertNotEqual(ten.hashValue, otherFive.hashValue)
    }
    
    func testSimpleAddition(){
        XCTAssertEqual(ten, five.plus(otherFive))
    }
    
    func testSimpleReduction(){
        XCTAssertEqual(try! five.reduced(to: "EUR", broker: broker), five)
    }
    
}
