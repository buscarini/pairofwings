//
//  Types.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

/// MARK: Errors

public enum ErrorCode {
	case Unknown
	case Assertion
	case Filtered
	case Cancelled
	case Load
	case LacksRequiredData
	case InvalidType
}

/// MARK: Autolayout

let LayoutPriorityRequired = 1000
let LayoutPriorityDefaultHigh = 750
let LayoutPriorityDragThatCanResizeWindow = 510
let LayoutPriorityWindowSizeStayPut = 500
let LayoutPriorityDragThatCannotResizeWindow = 490
let LayoutPriorityDefaultLow = 250
let LayoutPriorityFittingSizeCompression = 50

/// MARK: Device

public enum DeviceFamily {
	case Mac
	case iPhone
	case iPad
	case Watch
}

public enum DeviceOrientation {
	case Unknown
	case Portrait
	case PortraitUpsideDown
	case LandscapeLeft
	case LandscapeRight
}

public enum DeviceOrientationAxis {
	case Unknown
	case Portrait
	case Landscape
}

