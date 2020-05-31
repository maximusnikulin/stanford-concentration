//
//  CardModel.swift
//  Concentrarion
//
//  Created by Max Nikulin on 30.05.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import Foundation

class Concentration
{
    
    var flipCounter: Int = 0
    var cards = Array<Card>()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var score: Int = 0
    
    func chooseCard (at index: Int)
    {
        flipCounter += 1
        if !cards[index].isMatched {
            /**
             One already flippedUp
             */
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                /**
                 Matched
                 */
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    /**
                     Matched
                     */
                    
                    score -= cards[matchIndex].wasFlpped ? 1 : 0
                    score -= cards[index].wasFlpped ? 1 : 0                    
                    
                    cards[index].wasFlpped = true
                    cards[matchIndex].wasFlpped = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }  else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
