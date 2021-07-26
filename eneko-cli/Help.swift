//
//  help.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Help: Command {
    
    private let uiService: IOServiceProtocol
    
    init(ioService: IOServiceProtocol) {
        uiService = service
    }
    
    func execute(args: [String]?) -> Int32 {
        let message = """
        Available commands:

                get [option] - gets the requested information about Eneko
                download [option] - downloads useful assets
                visit [option] - navigate through related web pages
                contact [option] - performs operations to get in touch with Eneko

        Usage examples:

                eneko get name
                eneko download cv
                eneko contact email
                eneko visit github

        To get more info about each command, type:

                eneko [command] help
        """
        uiService.write(message, color: .white)
        return 0
    }
    
    func showUsageDescription() {
        let message = """
        To get more info about each command, type:

                eneko [command] help
        """
        uiService.write(message, color: .white)
    }
}
