//
//  LabeledSegment.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 03/08/2023.
//

import SwiftUI

func LabeledSegment<T: RandomAccessCollection>(_ label: String,
                                               value: Binding<T.Element>,
                                               sources: T) -> some View
where T.Element: Hashable ,
      T.Element: CustomStringConvertible,
      T.Element: BinaryFloatingPoint
{
    Label {
        
        Picker(selection: value, content: {
            ForEach(sources, id: \.self) { item in
                Text(item.description)
            }
        }, label: {
            Text("\(label): \(value.wrappedValue.formatted())")
        })
        .pickerStyle(.segmented)
    } icon: {
        Text("\(label): \(value.wrappedValue.formatted())")
            .frame(width: 150, alignment: .leading)
    }
    .lineLimit(1)
    .minimumScaleFactor(0.8)
}

