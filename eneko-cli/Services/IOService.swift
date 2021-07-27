//
//  UI.swift
//  eneko-cli
//
//  Created by Eneko on 01/09/2020.
//

import Foundation

class IOService: IOServiceProtocol {
    
    var outputColor: Color = .noColor
    
    func read(_ input: String) {
        // TODO: implement
    }
    
    func write(_ message: String) {
        let messageToPrint = "\(outputColor.rawValue)\(message)\(Color.noColor.rawValue)"
        print(messageToPrint)
    }
    
    func setOutputColor(_ color: Color) {
        outputColor = color
    }
    
}
