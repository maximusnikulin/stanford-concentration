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
    var score: Double = 0
    var lastFlipDate: Date?
    
    func chooseCard (at index: Int)
    {
        flipCounter += 1
        if !cards[index].isMatched {
            /**
             One already flippedUp
             */
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                var timeSinceLastFlip: Double = 0
                if (lastFlipDate != nil) {
                    timeSinceLastFlip = Date().timeIntervalSince(lastFlipDate!)
                }
                
                /**
                 Matched
                 */
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    
                    print(timeSinceLastFlip)
                    if (timeSinceLastFlip > 2) {
                        score -= min(0.1 * timeSinceLastFlip, 1)
                    } else {
                        score += timeSinceLastFlip * 0.5
                    }
                } else {
                    /**
                     Matched
                     */
                    score -= cards[matchIndex].wasFlpped ? 1 : 0
                    score -= cards[index].wasFlpped ? 1 : 0                    
                                        
                    cards[index].wasFlpped = true
                    cards[matchIndex].wasFlpped = true
                }
                
                score = Double(round(score * 100) / 100)
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
                
            }  else {
                lastFlipDate = Date()
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
