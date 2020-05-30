//
//  ViewController.swift
//  Concentrarion
//
//  Created by Max Nikulin on 24.05.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardsButtons.count + 1) / 2)
    
    var flipCounter: Int = 0 {
        didSet {
            flipCounterLabel.text = String("FlipCounts: \(flipCounter)")
        }
    }
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    var emojiCards: [String] = ["👻", "🎃", "👻", "🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCounter += 1
        if let indexCard = cardsButtons.firstIndex(of: sender) {            
            game.chooseCard(at: indexCard)
            updateViewFromModel()
        } else {
            print("no cards with this emoji")
        }
    }
    
    func updateViewFromModel () {
        for index in cardsButtons.indices {
            let button = cardsButtons[index]
            let card = game.cards[index]
            
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5825584531, blue: 0, alpha: 1)
                
            }
        }
    }
    
    var emojiChoose = ["😀", "🪀", "⛹️", "🏋️‍♀️", "🤽‍♀️"]
    
    var emoji = Dictionary<Int, String>()
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoose.count > 0 {
            let randomIndex: Int = Int(arc4random_uniform(UInt32(emojiChoose.count)))
            emoji[card.identifier] = emojiChoose.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
        
    }
    
    @IBOutlet weak var flipCounterLabel: UILabel!
}

