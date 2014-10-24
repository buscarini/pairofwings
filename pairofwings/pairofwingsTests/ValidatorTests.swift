//
//  ValidatorTests.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation
import XCTest
import pairofwings

class ValidatorTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testClosureValidator() {
		let validator = ClosureValidator() {
			(let value : Int) in
			return value>10;
		}
		
		XCTAssert(validator.validate(11));
		XCTAssertFalse(validator.validate(5));

		validator.closure = {
			return $0==7;
		}
		
		
		XCTAssert(validator.validate(7));
		XCTAssertFalse(validator.validate(5));
		XCTAssertFalse(validator.validate(11));
	}
	
	func testRangeValueValidator() {
		let validator = RangeValueValidator(10,40)

		XCTAssertFalse(validator.validate(5));
		XCTAssert(validator.validate(10));
		XCTAssert(validator.validate(20));
		XCTAssert(validator.validate(40));
		XCTAssertFalse(validator.validate(50));
		
		validator.min = 2
		
		XCTAssertFalse(validator.validate(1));
		XCTAssert(validator.validate(2));
		XCTAssert(validator.validate(20));
		XCTAssert(validator.validate(40));
		XCTAssertFalse(validator.validate(50));
	}
}