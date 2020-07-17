
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
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 20).fill(Color.pink)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 6).fill(Color.orange)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
