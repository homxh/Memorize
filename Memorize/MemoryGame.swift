//
//  MemoryGame.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/10/24.
//
//  This is Model of Memorize. (UI Independent; Data + Logic; "The Truth")

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    //declare a Generics
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<numberOfPairsOfCards{
//            let content: CardContent = cardContentFactory(pairIndex)
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{
            var faceUpCardIndices = [Int]()
            for index in cards.indices{
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1{
                return faceUpCardIndices.first
            }else{
                return nil
            }
        }
        
        set {
            for index in cards.indices{
                if index == newValue{
                    cards[index].isFaceUp = true
                }else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            // ( where: { cardToCheck in cardToCheck.id == card.id} )
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }

                }else{
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp = true
            }
            
//            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    private func index(of card: Card) -> Int?{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
        //FIXME: bogus!
    }
    
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {

//        static func == (lhs: Card,
//                        rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//            // means left hand side == right hand side
//        }
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        //protocol #Identifiable
        
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        //protocol #CustomDebugStringConvertible
    }
}
