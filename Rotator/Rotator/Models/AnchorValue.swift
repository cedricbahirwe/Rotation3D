//
//  AnchorValue.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 02/08/2023.
//

import SwiftUI

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
    
    static let center = AnchorValue(0.5, 0.5)
}
