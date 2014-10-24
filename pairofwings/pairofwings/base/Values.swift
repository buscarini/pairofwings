//
//  Value.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 josé manuel sánchez. All rights reserved.
//

import Foundation


public protocol ValueProtocol : ObservableProtocol {
	typealias T
	var currentValue : T? { get }
//	func __conversion() -> T?
}

public protocol ValueChangeProtocol {
	typealias T
	var currentValue : T? { get set }
//	func __conversion(T?)
}

public class BaseValue <T> : Observable<T>, ValueProtocol  {
	
	var raw : T? {
		willSet {
			if let list = observers[.WillSet] {
				for closure in list {
					closure(newValue,self.raw)
				}
			}
		}
		
		didSet {
			if let list = observers[.DidSet] {
				for closure in list {
					closure(self.raw,oldValue)
				}
			}
		}
	}
	
	public var currentValue : T? {	get { return raw }	}
}

public class Value<T> : BaseValue<T>,ValueChangeProtocol {
	
	public override var currentValue : T? {
		set(newValue) { raw = newValue }
		get { return raw }
	}
	
	public override init() {
		super.init()
		
		raw = nil
	}
	
	public init (_ value: T?) {
		super.init()
		
		raw = value
	}
}
