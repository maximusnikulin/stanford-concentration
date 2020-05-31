//
//  Card.swift
//  Concentrarion
//
//  Created by Max Nikulin on 30.05.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import Foundation

struct Card
{
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    var wasFlpped: Bool = false
    
    static var idFactory = 0
    static func getUniqId () -> Int {
        Card.idFactory += 1
        return Card.idFactory
    }
    
    init() {
        identifier = Card.getUniqId()
    }
}
