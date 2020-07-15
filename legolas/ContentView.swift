//
//  ContentView.swift
//  legolas
//
//  Created by Ömer Aksu on 15.07.2020.
//  Copyright © 2020 omeraksu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            ForEach(0..<4) { index in
              CardView(isFaceUp: true)
            }
        }.padding()
            .foregroundColor(Color.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20).fill(Color.white)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 6)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 20).fill()
            }
              
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
