//
//  valueTests.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Cocoa
import XCTest

class valueTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFixedValue() {
		var number = FixedValue(12)
		
		XCTAssert(number==12);
		XCTAssert(number.currentValue==12);
		
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
