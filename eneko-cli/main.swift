//
//  main.swift
//  eneko-cli
//
//  Created by Eneko on 01/09/2020.
//

import Foundation


CommandLine.arguments.removeFirst()
var arguments = CommandLine.arguments
let ioService = IOService()
let datetimeService = DatetimeService()

guard let actionString = arguments.first else {
    ioService.write("eneko-cli version 1.0.0")
    exit(0)
}

do {
    guard let action = Action(rawValue: actionString) else { throw CommandError.invalidAction(actionString) }
    arguments.removeFirst()
    switch action {
    case .help: try Help(ioService: ioService).execute(args: arguments); break
    case .version: try Version(ioService: ioService).execute(args: arguments); break
    case .get: try Get(ioService: ioService, datetimeService: datetimeService).execute(args: arguments); break
    case .see: break
    case .contact: break
    case .download: break
    }
} catch CommandError.invalidAction(let action) {
    ioService.setOutputColor(.red)
    ioService.write("\nInvalid command: \(action)")
    ioService.setOutputColor(.noColor)
    Help(ioService: ioService).showUsageDescription()
} catch CommandError.informationNotAvailable(let information) {
    ioService.setOutputColor(.red)
    ioService.write("\nInformation not available: \(information)")
    ioService.setOutputColor(.noColor)
    Get(ioService: ioService, datetimeService: datetimeService).showUsageDescription()
} catch CommandError.resourceNotAvailable(let resource) {
    ioService.setOutputColor(.red)
    ioService.write("\nResource not available: \(resource)")
} catch CommandError.pageNotAvailable(let page) {
    ioService.setOutputColor(.red)
    ioService.write("\nPage not available: \(page)")
    ioService.setOutputColor(.noColor)
} catch {
    ioService.setOutputColor(.red)
    ioService.write("\nUnexpected error happened\n")
}

