//
//  Theme.swift
//  Concentrarion
//
//  Created by Max Nikulin on 03.06.2020.
//  Copyright © 2020 Max Nikulin. All rights reserved.
//

import Foundation
import UIKit

protocol PTheme {
    var emojies: [String] {get}
    var bgColor: UIColor {get}
    var cardColor: UIColor {get}
}

struct Theme: PTheme
{
    var emojies: [String]
    var bgColor: UIColor
    var cardColor: UIColor
}
