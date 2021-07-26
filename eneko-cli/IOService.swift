//
//  UI.swift
//  eneko-cli
//
//  Created by Eneko on 01/09/2020.
//

import Foundation

class IOService: IOServiceProtocol {
    
    func read(_ input: String) {
        // TODO: implement
    }
    
    func write(_ message: String, color: Color?) {
        let textColor = color ?? .white
        print("\(textColor.rawValue)\(message)\(Color.white.rawValue)")
    }
    
}
