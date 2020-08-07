//
//  ViewController.swift
//  Concentrarion
//
//  Created by Max Nikulin on 24.05.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Concentration! {
        didSet {
            updateViewFromModel()
        }
    }

    var theme: Theme! {
        didSet {
            emojiChoose = theme.emojies
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        game = newGame()        
    }
    
    var emojiChoose: [String] = []
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let indexCard = cardButtons.firstIndex(of: sender) {            
            game.chooseCard(at: indexCard)
            updateViewFromModel()
        } else {
            print("no cards with this emoji")
        }
    }
    
    func updateViewFromModel () {
        flipCounterLabel.text = String("FlipCounts: \(game.flipCounter)")
        scoreLabel.text = String("Score: \(game.score)")
        self.view.backgroundColor = theme.bgColor
        for btn in cardButtons {
            btn.backgroundColor = theme.cardColor
        }
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : theme.cardColor
                
            }
        }
    }
    
    func newGame () -> Concentration {
        theme = ThemeFactory.getRandomly()
        print(theme.emojies, theme.bgColor)
        return Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game = newGame()
        updateViewFromModel()
    }
    
    @IBOutlet weak var scoreLabel: UILabel!

    
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

