//
//  Value.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 josé manuel sánchez. All rights reserved.
//

import Foundation


protocol ValueProtocol : Observable {
	typealias T
	var currentValue : T? { get }
}

protocol ValueChangeProtocol {
	typealias T
	var currentValue : T? { get set }
}

class Value <T> : ValueProtocol  {
	var observers = [ ObservationType : Array<(T?, T?) -> ()>]()
	
	var raw : T? {
		willSet {
			if let list = observers[.WillSet] {
				for closure in list {
					closure(self.raw,newValue)
				}
			}
		}
		
		didSet {
			if let list = observers[.DidSet] {
				for closure in list {
					closure(oldValue,self.raw)
				}
			}
		}
	}
	
	var currentValue : T? {	get { return raw }	}
	
	func addObserver(type: ObservationType,closure : (T?,T?) -> ()) {
		if observers[type]==nil {
			observers[type] = Array<(T?, T?) -> ()>()
		}
		
		var expandedArray = observers[type]!
		expandedArray.append(closure)
		observers[type] = expandedArray
	}
	
	func __conversion() -> T? {
		return currentValue;
	}
	
}

class FixedValue<T> : Value<T> {
	
	override var currentValue : T? {
		set(newValue) { raw = newValue }
		get { return raw }
	}
	
	func __conversion(var value : T) {
		raw = value
	}
	
	init (value: T?) {
		super.init()
		
		raw = value
	}
}

