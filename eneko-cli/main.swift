//
//  main.swift
//  eneko-cli
//
//  Created by Eneko on 01/09/2020.
//

import Foundation


CommandLine.arguments.removeFirst()
var arguments = CommandLine.arguments
let service = IOService()
guard let actionString = arguments.first else { service.write("eneko-cli version 1.0.0", color: .white); exit(0) }
guard let action = Action(rawValue: actionString) else { service.write("Unavaliable command \(actionString)", color: .red); exit(1) }

var exitCode: Int32 = 0
arguments.removeFirst()
switch action {
case .help: exitCode = Help(ioService: service).execute(args: arguments); break
case .get: exitCode = Get().execute(args: arguments); break
case .contact: break
case .download: break
case .visit: break
}
exit(exitCode)
