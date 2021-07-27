//
//  get.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Get: Command {
    
    private let ioService: IOServiceProtocol
    
    init(ioService: IOServiceProtocol) {
        self.ioService = ioService
    }
    
    func execute(args: [String]?) throws {
        guard let element = args?.first else { /* TODO: ask element */ return }
        switch element {
        case "help": showUsageDescription()
        case "all": writeAllInfo(); break
        case "name": ioService.write("Eneko Díaz Romero"); break
        case "birthday": writeBirthday(); break
        case "age": writeAge(); break
        case "phone": ioService.write("+34 611 433 134"); break
        case "email": ioService.write("contacto@enekodiaz.es"); break
        case "web": ioService.write("https://enekodiaz.es"); break
        case "location": ioService.write("Alcalá de Henares, Madrid"); break
        default: throw CommandError.informationNotAvailable(element)
        }
    }
    
    private func writeAllInfo() {
        
    }
    
    private func writeBirthday() {
        
    }
    
    private func writeAge() {
        
    }
    
    func showUsageDescription() {
        let message = """
        
        These are the available options for get command:
        
            all         - All the information available in a list
            name        - My full name
            birthday    - The date of my birth
            age         - My current age
            phone       - The phone number to contact me with
            email       - The email to contact me with
            web         - The url of my web page
            location    - The place where I currently live
        
        """
        ioService.write(message)
    }
}
