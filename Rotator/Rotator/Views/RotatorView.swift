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
                ControlsView(rotator: $rotator)
                
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
