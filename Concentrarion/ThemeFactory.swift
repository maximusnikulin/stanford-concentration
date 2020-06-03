//
//  ThemeFactory.swift
//  Concentrarion
//
//  Created by Max Nikulin on 03.06.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import Foundation

enum Themes {
    case sport, newYear, boys, girls
}

var themes: [Themes: Theme] = [
    .sport: Theme(emojies: ["🏀", "🏈", "🪀", "🥎", "🏐", "🏉", "🎱", "😃"], bgColor: #colorLiteral(red: 1, green: 0.5825584531, blue: 0, alpha: 1), cardColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),
    .newYear: Theme(emojies: ["🥶", "🤶", "🎅🏻", "🌲", "🎅🏽", "🎅🏿", "🤶🏾", "😘"], bgColor: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), cardColor:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
    .boys: Theme(emojies:["🙆‍♂️", "🙍🏻‍♂️", "🚶‍♂️", "🏃🏾‍♂️", "👦🏽", "💇🏽‍♂️", "💆🏽‍♂️", "🤪"], bgColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), cardColor:#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)),
    .girls: Theme(emojies:["💁🏻‍♀️", "🧗‍♀️", "👯‍♀️", "💁🏽‍♀️", "💁🏿‍♀️", "💁🏼‍♀️", "💁‍♀️", "😎"], bgColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), cardColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
]


class ThemeFactory
{
    static func create (theme: Themes) -> Theme {
        return themes[theme]!
    }
    
    static func getRandomly () -> Theme {
            let randomIndex = Int(arc4random_uniform(UInt32(themes.count)))
            let randomThemeName = Array(themes.keys)[randomIndex]
            return themes[randomThemeName]!
    }
}
