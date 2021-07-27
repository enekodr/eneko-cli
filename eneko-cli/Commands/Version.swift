//
//  help.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Version: Command {
    
    private let ioService: IOServiceProtocol
    
    init(ioService: IOServiceProtocol) {
        self.ioService = ioService
    }
    
    func execute(args: [String]?) throws {
        let message = "1.0.0"
        ioService.write(message)
    }
    
    func showUsageDescription() {
        
    }
}
