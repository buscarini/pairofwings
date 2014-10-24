//
//  valueTests.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest
import pairofwings

class ValueTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testValue() {
		var number = Value(12)

		XCTAssert(number.currentValue==12);
		
		var timesCalled = 0
		
		number.addObserver(.DidSet) {
			[unowned number] (newValue,oldValue) in
			XCTAssert(newValue==number.currentValue);
			timesCalled++
		}

		number.currentValue = 5
		
		let value = number.currentValue;
		XCTAssert(value==5);
		XCTAssert(timesCalled==1)
		
		number.currentValue = 7
		
		XCTAssert(number.currentValue==7);
		XCTAssert(timesCalled==2)
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
			var number: Value<Int> = Value()
			for _ in 0...1000 {
				number.currentValue = Utils.random(0,100)
			}
        }
    }

}
