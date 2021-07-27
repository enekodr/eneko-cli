//
//  IOServiceInterface.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

protocol IOServiceProtocol {
    
    func read(_ input: String)
    func write(_ message: String)
    func setOutputColor(_ color: Color)
    
}
