//
//  Extensions.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation


extension String {
	subscript (i: Int) -> String {
		return String(Array(self)[i])
	}
	
	subscript (r: Range<Int>) -> String {
		var start = advance(startIndex, r.startIndex)
		var end = advance(startIndex, r.endIndex)
		return substringWithRange(Range(start: start, end: end))
	}
}

extension Array {
	func indexOfObject<T: Equatable>(objectToFind: T) -> Int? {
		for (index,object) in enumerate(self) {
			 if let to = object as? T {
				if to==objectToFind {
					return index
				}
			}
		}
		
		return nil
	}
	
	mutating func remove<T : Equatable>(object : T) -> Bool {
		let index = indexOfObject(object)
		if let i = index {
			removeAtIndex(i)
			return true
		}
		
		return false
	}
}