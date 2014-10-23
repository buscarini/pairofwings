//
//  Observable.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

enum ObservationType {
	case WillSet
	case DidSet
}

protocol Observable {
	typealias T
	func addObserver(type: ObservationType,closure : (T?,T?) -> ())
}