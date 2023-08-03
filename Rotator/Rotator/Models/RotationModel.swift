//
//  RotationModel.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 24/11/2022.
//

import SwiftUI

struct Rotator: Equatable {
    var width: CGFloat = 200
    var height: CGFloat = 200
    var angle: Angle = .degrees(0)
    var axis: ThreeDimensionPoint = ThreeDimensionPoint()
    var anchor: AnchorValue = .center
    var anchorZ: CGFloat = 0
    var perspective: CGFloat = 1
    
    var cornerRadius: CGFloat {
        max(width/20 + height/20, 0)
    }
    
    let sizeRange: ClosedRange<CGFloat> = 100...600
    let angleRange: ClosedRange<Double> = 0...360
    let axisRange: [CGFloat] = [-1,0,1]
    
}
