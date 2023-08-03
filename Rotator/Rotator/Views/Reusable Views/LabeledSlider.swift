//
//  LabeledSlider.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 03/08/2023.
//

import SwiftUI

func LabeledSlider<T: BinaryFloatingPoint>(_ label: String,
                                            value: Binding<T>,
                                            range: ClosedRange<T>,
                                            step: T.Stride) -> some View where T.Stride: BinaryFloatingPoint {
    Label {
        Slider(value: value,
               in: range, step: step) {
            Text("")
        } minimumValueLabel: {
            Text(range.lowerBound.formatted())
        } maximumValueLabel: {
            Text(range.upperBound.formatted())
        }
    } icon: {
        Text("\(label): \(value.wrappedValue.formatted())")
            .frame(width: 150, alignment: .leading)
    }
    .lineLimit(1)
    .minimumScaleFactor(0.8)
}
