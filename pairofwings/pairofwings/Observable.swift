//
//  Observable.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

public enum ObservationType {
	case WillSet
	case DidSet
}

public protocol ObservableProtocol {
	typealias T
	func addObserver(closure : (T?,T?) -> ())
	func addObserver(type: ObservationType,closure : (T?,T?) -> ())
}

public class Observable<T> : ObservableProtocol {
	var observers = [ ObservationType : Array<(T?, T?) -> ()>]()
	
	public func addObserver(closure : (T?,T?) -> ()) {
		self.addObserver(.DidSet, closure)
	}

	public func addObserver(type: ObservationType,closure : (T?,T?) -> ()) {
		if observers[type]==nil {
			observers[type] = Array<(T?, T?) -> ()>()
		}
		
		var expandedArray = observers[type]!
		expandedArray.append(closure)
		observers[type] = expandedArray
	}
}