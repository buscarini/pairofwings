//
//  Utils.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

public class Utils {
	public class func random(min: Int, _ max:Int) -> Int {
		return min + Int(arc4random_uniform(UInt32(max - min + 1)))
	}
	
	public class func random(min: Double,_ max : Double) -> Double {
		assert(max>min)
		
		return Double(arc4random_uniform(UInt32(max - min + 1))) + min
	}
}

