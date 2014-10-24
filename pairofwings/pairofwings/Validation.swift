//
//  Validation.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation


public protocol ValidatorProtocol {
	typealias T
	func validate(value : T) -> Bool
}


public class Validator<T> : ValidatorProtocol {
	
	public func validate(value : T) -> Bool {
		return true
	}
}

public class ClosureValidator<T> : Validator<T> {
	
	public var closure : (T) -> Bool
	
	public init(closure: (T) -> Bool) {
		self.closure = closure
	}
	
	public override func validate(value: T) -> Bool {
		return closure(value)
	}
}

public class RangeValueValidator<T : Comparable> : Validator <T> {
	
	public var min : T
	public var max : T
	
	public init(_ min: T,_ max: T) {
		self.min = min
		self.max = max
	}
	
	public override func validate(value: T) -> Bool {
		return (value>=self.min && value<=self.max)
	}
	
}