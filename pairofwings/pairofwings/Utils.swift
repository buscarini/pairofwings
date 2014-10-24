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
	
	public class func random(length: Int) -> String {
		assert(length>0)
		
		let alphabet = "abcdefghijklmnopqrstuvwxyz"
		let alphabetLength = alphabet.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

		var result = ""
		for i in 0..<length {
			let index = Int(arc4random_uniform(UInt32(alphabetLength)))
			let character = alphabet[index % alphabetLength]
			result += character
		}
		
		return result
	}
}

