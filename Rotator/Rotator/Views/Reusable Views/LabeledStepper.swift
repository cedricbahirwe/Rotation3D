//
//  LabeledStepper.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 03/08/2023.
//

import SwiftUI

func LabeledStepper<T: BinaryFloatingPoint>(_ label: String,
                                            value: Binding<T>,
                                            range: ClosedRange<T>,
                                            step: T.Stride) -> some View where T.Stride: BinaryFloatingPoint {
    Stepper("\(label): \(value.wrappedValue.formatted())", value: value, in: range)
        .lineLimit(1)
        .minimumScaleFactor(0.8)
}
