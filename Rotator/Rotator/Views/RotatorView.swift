//
//  RotatorView.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 24/11/2022.
//

import SwiftUI

struct RotatorView: View {
    private let screen = UIScreen.main.bounds.size
    @State private var rotator = Rotator(angle: .degrees(0))
    @State private var isFrameOn = true
    
    let rotatorSizeRange: ClosedRange<CGFloat> = 100...600
    let angleRange: ClosedRange<Double> = 0...360
    let axisRange: [CGFloat] = [-1,0,1]
    
    var body: some View {
        VStack {
            GridLayout(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    ColoredView(.red, 1)
                    ColoredView(.green, 2)
                }
                
                GridRow {
                    ColoredView(.blue, 3)
                    ColoredView(.yellow, 4)
                }
            }
            .frame(width: rotator.width, height: rotator.height)
            .cornerRadius(rotator.cornerRadius)
            .rotation3DEffect(rotator.angle,
                              axis: rotator.axis.tupled,
                              anchor: rotator.anchor.tupled,
                              anchorZ: rotator.anchorZ,
                              perspective: rotator.perspective)
            .border(isFrameOn ? .gray : .clear)
            .animation(.spring(), value: rotator)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topTrailing, content: {
                Text("Made by [@cedricbahirwe](https://twitter.com/cedricbahirwe)")
                    .font(.system(size: 20,
                                  weight: .semibold,
                                  design: .monospaced))
                    .foregroundColor(.red)
                    .padding(10)
            })
            .border(.secondary)
            .padding()
            
            VStack {
                HStack(spacing: 30) {
                    Group {
                        VStack(alignment: .leading, spacing: 10) {
                            LabeledSlider("Degree",
                                          value: $rotator.angle.degrees,
                                          range: angleRange,
                                          step: 1)
                            
                            LabeledSegment("Axis X", value: $rotator.axis.x, sources: axisRange)
                            
                            LabeledSegment("Axis Y", value: $rotator.axis.y, sources: axisRange)
                            
                            LabeledSegment("Axis Z", value: $rotator.axis.z, sources: axisRange)
                            
                            LabeledSlider("Perspective",
                                          value: $rotator.perspective,
                                          range: 0...1,
                                          step: 0.1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            LabeledSlider("Anchor X",
                                          value: $rotator.anchor.x,
                                          range: 0...1,
                                          step: 0.1)
                            
                            LabeledSlider("Anchor Y",
                                          value: $rotator.anchor.y,
                                          range: 0...1,
                                          step: 0.1)
                           
                            LabeledSlider("AnchorZ",
                                          value: $rotator.anchorZ,
                                          range: -1...1,
                                          step: 0.1)
                            
                       
                            
                            LabeledSlider("Width",
                                          value: $rotator.width,
                                          range: rotatorSizeRange,
                                          step: 10)
                            LabeledSlider("Height",
                                          value: $rotator.height,
                                          range: rotatorSizeRange,
                                          step: 10)
                            
                      
                            
                        }
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                }
                .font(.title2)
                
                HStack(spacing: 40) {
                    Toggle("\(isFrameOn ? "Disable" : "Enable") Border Frame",
                           isOn: $isFrameOn)
                        .fixedSize()
                    
                    Button("Reset", role: .destructive) {
                        withAnimation(.spring().speed(0.75)) {
                            rotator = Rotator()
                        }
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                }
                .font(.title2)

            }
            .padding(.horizontal)
        }
        .background(.green.opacity(0.3))
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


func LabeledStepper<T: BinaryFloatingPoint>(_ label: String,
                                            value: Binding<T>,
                                            range: ClosedRange<T>,
                                            step: T.Stride) -> some View where T.Stride: BinaryFloatingPoint {
    Stepper("\(label): \(value.wrappedValue.formatted())", value: value, in: range)
        .lineLimit(1)
        .minimumScaleFactor(0.8)
}

func LabeledSegment<T: RandomAccessCollection>(_ label: String,
                                               value: Binding<T.Element>,
                                               sources: T) -> some View
where T.Element: Hashable ,
      T.Element: CustomStringConvertible,
      T.Element: BinaryFloatingPoint {
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

struct ColoredView: View {
    let color: Color
    let number: Int
    
    init(_ color: Color, _ number: Int) {
        self.color = color
        self.number = number
    }
    
    var body: some View {
        GeometryReader { geo  in
            color
                .overlay {
                    Image(systemName: "\(number).circle")
                        .resizable()
                        .imageScale(.large)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: getSize(geo), height: getSize(geo))
                }
        }
    }
    
    private func getSize(_ geo: GeometryProxy) -> CGFloat {
        min(geo.size.width / 2, geo.size.height / 2)
    }
}
