//
//  CommandErrorEnum.swift
//  eneko
//
//  Created by Eneko on 27/7/21.
//

import Foundation

enum CommandError: Error {
    case invalidAction(_ action: String)
    case informationNotAvailable(_ information: String)
    case resourceNotAvailable(_ resource: String)
    case pageNotAvailable(_ page: String)
    case contactOptionNotAvailable(_ option: String)
}
