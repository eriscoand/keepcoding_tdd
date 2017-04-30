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
    
    var five: Money!
    var otherFive: Money!
    var ten: Money!
    var broker: Broker!
    
    override func setUp() {
        super.setUp()
        five = Money(amount: 5)
        otherFive = Money(amount: 5)
        ten = Money(amount: 10)
        broker = Broker()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanCreateEuro(){
        XCTAssertNotNil(Money())
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
