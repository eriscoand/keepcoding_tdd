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
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testCanCreateWad(){
        XCTAssertNotNil(Wad())
    }
    
}
