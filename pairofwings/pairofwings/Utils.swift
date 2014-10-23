//
//  Utils.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 23/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

func random(min: Int, max:Int) -> Int {
	return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func random(min: Double, max : Double) -> Double {
	assert(max>min)

	return Double(arc4random_uniform(UInt32(max - min + 1))) + min
}