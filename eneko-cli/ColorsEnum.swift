//
//  color.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

enum Color: String {
    case noColor = "\u{001B}[0m"
    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case whiteBold = "\u{001B}[1;37m"
}
