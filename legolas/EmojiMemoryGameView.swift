
//  EmojiMemoryGameView.swift
//  legolas

//  Created by Ömer Aksu on 15.07.2020.
//  Copyright © 2020 omeraksu. All rights reserved.


import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        
        VStack(spacing: 40) {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card) 
                }
            }
        }.padding()
            .foregroundColor(Color.blue)
            .font(.largeTitle)
    }
}

struct CardView: View {
    var card : MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    func body(for size: CGSize) -> some View {
        ZStack {
           if self.card.isFaceUp {
               RoundedRectangle(cornerRadius: cornerRadius).fill(Color.pink)
               RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).fill(Color.orange)
               Text(self.card.content)
           } else {
               RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: 4)
           }
       }
        .font(Font.system(size: fontSize(for: size)))
    }
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
