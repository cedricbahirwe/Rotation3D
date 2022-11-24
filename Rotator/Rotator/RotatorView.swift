//
//  RotatorView.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 24/11/2022.
//

import SwiftUI

struct RotatorView: View {
    private let screen = UIScreen.main.bounds.size
    @State private var rotator = Rotator(angle: .degrees(60))
    var cornerRadius: CGFloat {
        max(rotator.width/20 + rotator.height/20, 0)
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Color.red
                    Color.green
                }
                HStack(spacing: 0) {
                    Color.blue
                    Color.black
                }
            }
            .frame(width: rotator.width, height: rotator.height)
            .cornerRadius(rotator.cornerRadius)
            .rotation3DEffect(rotator.angle,
                              axis: rotator.axis.tupled,
                              anchor: rotator.anchor.tupled,
                              anchorZ: rotator.anchorZ,
                              perspective: rotator.perspective)
            .animation(.spring(), value: rotator)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green.opacity(0.3))

            VStack( spacing: 10) {
                HStack(alignment: .top, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {

                        LabeledSlider("Axis X",
                                      value: $rotator.axis.x,
                                      range: -180...180,
                                      step: 1)

                        LabeledSlider("Axis Y",
                                      value: $rotator.axis.y,
                                      range: 0...360,
                                      step: 5)

                        LabeledSlider("Axis Z",
                                      value: $rotator.axis.z,
                                      range: -360...360,
                                      step: 5)

                        LabeledSlider("Anchor X",
                                      value: $rotator.anchor.x,
                                      range: 0...1,
                                      step: 0.1)

                        LabeledSlider("Anchor Y",
                                      value: $rotator.anchor.y,
                                      range: 0...1,
                                      step: 0.1)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        LabeledSlider("Degree",
                                      value: $rotator.angle.degrees,
                                      range: 0...360,
                                      step: 10)

                        LabeledSlider("Perspective",
                                      value: $rotator.perspective,
                                      range: 0...1,
                                      step: 0.1)

                        LabeledSlider("Width",
                                      value: $rotator.width,
                                      range: 10...1000,
                                      step: 10)
                        LabeledSlider("Height",
                                      value: $rotator.height,
                                      range: 10...1000,
                                      step: 10)

                        LabeledSlider("AnchorZ",
                                      value: $rotator.anchorZ,
                                      range: 0...1,
                                      step: 0.1)

                    }
                }

                HStack {
                    Button("Reset", role: .destructive) {
                        withAnimation(.spring()) {
                            rotator = Rotator()
                        }
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(30)
            .frame(maxWidth: screen.width*0.7)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .font(.title2)
        }
    }
}

struct RotatorView_Previews: PreviewProvider {
    static var previews: some View {
        RotatorView()
    }
}


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
