//
//  EmojiMemoryGame.swift
//  legolas
//
//  Created by Ömer Aksu on 16.07.2020.
//  Copyright © 2020 omeraksu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    
    private var modal: MemoryGame<String> = EmojiMemoryGame.createMemoryGame() 
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return modal.cards
    }
    
    // MARK - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        modal.choose(card: card)
    }
}
