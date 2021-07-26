//
//  get.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Get: Command {
    
    func execute(args: [String]?) -> Int32 {
        guard let element = args?.first else {
            return 1
        }
        switch element {
        case "help":
            showUsageDescription()
            return 0
        case "name":
            print("Eneko")
            return 0
        default:
            return 1
        }
    }
    
    func showUsageDescription() {
        print("Requesting help")
    }
}
