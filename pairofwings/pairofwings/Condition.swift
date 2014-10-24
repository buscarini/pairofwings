//
//  Condition.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

public protocol ConditionProtocol {
	func evaluate() -> Bool
}

public class Condition: ConditionProtocol {
	public func evaluate() -> Bool {
		return false
	}
}

public class ClosureCondition : Condition {
	
	var closure : () -> Bool
	
	public init(closure : () -> Bool) {
		self.closure = closure
	}
	
	public override func evaluate() -> Bool {
		return closure()
	}
}