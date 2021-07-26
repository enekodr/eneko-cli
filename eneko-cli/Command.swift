//
//  get.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

protocol Command {
    
    func execute(args: [String]?) -> Int32
    func showUsageDescription()
    
}
