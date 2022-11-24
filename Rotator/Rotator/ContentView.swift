//
//  ContentView.swift
//  Rotator
//
//  Created by Cédric Bahirwe on 24/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RotatorView()
            Text("Made by [@cedricbahirwe](https://github.com/cedricbahirwe)")
                .font(.system(size: 20,
                              weight: .semibold,
                              design: .monospaced))
                .foregroundColor(.red)
                .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
