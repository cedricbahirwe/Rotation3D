//
//  ControlsView.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 03/08/2023.
//

import SwiftUI

struct ControlsView: View {
    @Binding var rotator: Rotator
    var body: some View {
        HStack(spacing: 30) {
            Group {
                VStack(alignment: .leading, spacing: 10) {
                    LabeledSlider("Degree",
                                  value: $rotator.angle.degrees,
                                  range: rotator.angleRange,
                                  step: 1)
                    
                    LabeledSegment("Axis X", value: $rotator.axis.x, sources: rotator.axisRange)
                    
                    LabeledSegment("Axis Y", value: $rotator.axis.y, sources: rotator.axisRange)
                    
                    LabeledSegment("Axis Z", value: $rotator.axis.z, sources: rotator.axisRange)
                    
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
                                  range: rotator.sizeRange,
                                  step: 10)
                    LabeledSlider("Height",
                                  value: $rotator.height,
                                  range: rotator.sizeRange,
                                  step: 10)
                    
              
                    
                }
                
            }
            .padding(30)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
        }
        .font(.title2)
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(rotator: .constant(.init()))
    }
}
