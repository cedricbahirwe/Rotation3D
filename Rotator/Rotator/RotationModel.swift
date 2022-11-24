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
    var anchor: AnchorValue = AnchorValue()
    var anchorZ: CGFloat = 0
    var perspective: CGFloat = 1

    var cornerRadius: CGFloat {
        max(width/20 + height/20, 0)
    }
}

struct ThreeDimensionPoint: Equatable {
    init(_ x: CGFloat = 0,
                  _ y: CGFloat = 0,
                  _ z: CGFloat = 0) {
        self.x = x
        self.y = y
        self.z = z
    }

    var x: CGFloat
    var y: CGFloat
    var z: CGFloat

    var tupled: (CGFloat, CGFloat, CGFloat) {
        (x, y, z)
    }
}


struct AnchorValue: Equatable {
    init(_ x: CGFloat = 0, _ y: CGFloat = 0) {
        self.x = x
        self.y = y
    }

    var x: CGFloat
    var y: CGFloat

    var tupled: UnitPoint {
        UnitPoint(x: x, y: y)
    }
}
