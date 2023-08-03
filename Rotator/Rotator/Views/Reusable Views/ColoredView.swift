//
//  ColoredView.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 03/08/2023.
//

import SwiftUI

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


struct ColoredView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredView(.red, 1)
    }
}
