//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/10/24.
//
//  This is Model of Memorize.

import Foundation

struct MemoryGame<CardContent> {
    //declare a Generics
    
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
