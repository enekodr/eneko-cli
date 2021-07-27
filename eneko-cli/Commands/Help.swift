//
//  help.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Help: Command {
    
    private let ioService: IOServiceProtocol
    
    init(ioService: IOServiceProtocol) {
        self.ioService = ioService
    }
    
    func execute(args: [String]?) throws {
        let message = """
        
        Available commands:

                get [infomation] - gets the requested information about Eneko
                download [resource] - downloads useful assets
                contact [option] - performs operations to get in touch with Eneko
                see [page] - navigate through related web pages

        Usage examples:

                eneko get name
                eneko download cv
                eneko contact email
                eneko see github

        To get more info about each command, type:

                eneko [command] help
        
        """
        ioService.write(message)
    }
    
    func showUsageDescription() {
        let message = """
        
        These are the available commands

                get [infomation] - gets the requested information about Eneko
                download [resource] - downloads useful assets
                visit [page] - navigate through related web pages
                contact [option] - performs operations to get in touch with Eneko
        
        To get more info about each command, type:

                eneko [command] help
        
        """
        ioService.write(message)
    }
}
