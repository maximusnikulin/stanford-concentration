//
//  ViewController.swift
//  Concentrarion
//
//  Created by Max Nikulin on 24.05.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCounter: Int = 0 {
        didSet {
            flipCounterLabel.text = String("FlipCounts: \(flipCounter)")
        }
    }
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    var emojiCards: [String] = ["👻", "🎃", "👻", "🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let indexCard = cardsButtons.firstIndex(of: sender) {
            let emoji = emojiCards[indexCard]
            flipCard(withEmoji: emoji, on: sender)
        } else {
            print("no cards with this emoji")
        }
    }
    
    @IBOutlet weak var flipCounterLabel: UILabel!
    
    func flipCard(withEmoji emoji: String, on button: UIButton) -> Void {
        flipCounter += 1
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5825584531, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

