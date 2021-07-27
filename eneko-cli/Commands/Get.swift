//
//  get.swift
//  eneko-cli
//
//  Created by Eneko on 26/7/21.
//

import Foundation

struct Get: Command {
    
    private let ioService: IOServiceProtocol
    private let datetimeService: DatetimeServiceProtocol
    private var birthday: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 1993
        dateComponents.month = 8
        dateComponents.day = 19
        let date = Calendar.current.date(from: dateComponents)!
        return date
    }
    
    init(ioService: IOServiceProtocol, datetimeService: DatetimeServiceProtocol) {
        self.ioService = ioService
        self.datetimeService = datetimeService
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
        let message = """
        
        -------------------
        Name: Eneko Díaz Romero
        Age: \(calculateYearDifference(between: Date(), and: birthday))
        Brithday: \(getBirthdayString())
        Phone: +34 611 433 134
        Email: contacto@enekodiaz.es
        Web: https://enekodiaz.es
        Location: Alcalá de Henares, Madrid
        -------------------
        
        """
        ioService.write(message)
    }
    
    private func getBirthdayString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        let dateString = formatter.string(from: birthday)
        return dateString
    }
    
    private func writeBirthday() {
        let dateString = getBirthdayString()
        ioService.write(dateString)
    }
    
    private func writeAge() {
        datetimeService.getCurrentDate { result in
            switch result {
            case .success(let date):
                let age = calculateYearDifference(between: date, and: birthday)
                ioService.write("\(age)")
                break
            case .failure(_):
                let message = "Failed to get current time from server. It will be used local time instead.\n"
                ioService.setOutputColor(.yellow)
                ioService.write(message)
                ioService.setOutputColor(.noColor)
                let age = calculateYearDifference(between: Date(), and: birthday)
                ioService.write("\(age)")
            }
        }
    }
    
    private func calculateYearDifference(between firstDate: Date, and secondDate: Date) -> Int {
        let timeinterval = firstDate.timeIntervalSince(secondDate)
        let years = timeinterval / (60 * 60 * 24 * 365.25)
        return Int(years)
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
