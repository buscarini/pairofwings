//
//  UtilsTests.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest
import pairofwings

class UtilsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRandom() {
		for _ in 0...1000 {
			var value = Utils.random(0,10)
			XCTAssert(value>=0);
			XCTAssert(value<=10);
		}
		
		
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
			for _ in 0...1000 {
				var value = Utils.random(0,10)
			}
        }
    }

}
