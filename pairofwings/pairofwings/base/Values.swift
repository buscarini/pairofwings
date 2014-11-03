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
	var value : T? { get }
}

public protocol ValueChangeProtocol {
	typealias T
	var value : T? { get set }
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
	
	public var value : T? {	get { return raw }	}
}

public class Value<T> : BaseValue<T>,ValueChangeProtocol {
	
	public override var value : T? {
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

// MARK: Operators

func operateOptionals<T>(first : T?,second : T?,operation:(T,T)->T ) -> (T?) {
	if let v1 = first {
		if let v2 = second {
			return operation(v1,v2)
		}
	}
	return nil
}

func operationValue<ValueType: ValueProtocol where ValueType.T : IntegerArithmeticType> (lhs : ValueType,rhs : ValueType, operation : (ValueType.T,ValueType.T) -> ValueType.T) -> ValueType {
	let result = Value<ValueType.T>()

	result.value = operateOptionals(lhs.value, rhs.value,operation)

	lhs.addObserver {
		(newValue, oldValue) in
		result.value = operateOptionals(newValue, rhs.value,operation)
	}
	
	rhs.addObserver { (newValue, oldValue) in
		result.value = operateOptionals(lhs.value, newValue,operation)
	}
	
	return result as ValueType
}


func +<ValueType: ValueProtocol where ValueType.T : IntegerArithmeticType> (lhs : ValueType,rhs : ValueType) -> ValueType {
	return operationValue(lhs, rhs) { $0+$1 }
}

func -<ValueType: ValueProtocol where ValueType.T : IntegerArithmeticType> (lhs : ValueType,rhs : ValueType) -> ValueType {
	return operationValue(lhs, rhs) { $0-$1 }
}

func *<ValueType: ValueProtocol where ValueType.T : IntegerArithmeticType> (lhs : ValueType,rhs : ValueType) -> ValueType {
	return operationValue(lhs, rhs) { $0*$1 }
}

func %<ValueType: ValueProtocol where ValueType.T : IntegerArithmeticType> (lhs : ValueType,rhs : ValueType) -> ValueType {
	return operationValue(lhs, rhs) { $0%$1 }
}

