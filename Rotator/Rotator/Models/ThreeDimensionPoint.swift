//
//  ThreeDimensionPoint.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 02/08/2023.
//

import Foundation

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
