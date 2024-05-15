//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/10/24.
//
//  This is ViewModel of Memorize. (Binds View to Model; Interpreter; Gatekeeper)

import SwiftUI

//func creatCardContent(forPairAtIndex index: Int) -> String {
//    return ["👻","🎃","👽","🕷️","👺","🥷","🧛🏻‍♂️","🦇"][index]
//}


class EmojiMemoryGame: ObservableObject{
    
    private static let emojis = ["👻","🎃","👽","🕷️","👺","🥷","🧛🏻‍♂️","🦇"]
    
//    private var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: creatCardContent)
    
//    private var model = MemoryGame(
//        numberOfPairsOfCards: 4) { pairIndex in
//        return emojis[pairIndex]
//        }
   
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) {
            pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "⁉️"
            }
            
        }
    }
               
//    var objectWillChange: ObservableObjectPublisher
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle() 
//        objectWillChange.send()
    }
    
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
  
 
