//
//  DatetimeService.swift
//  eneko
//
//  Created by Eneko on 27/7/21.
//

import Foundation

class DatetimeService: DatetimeServiceProtocol {
    
    func getCurrentDate(_ completion: (Result<Date, Error>) -> Void) {
        // TODO: implement
        completion(.success(Date()))
    }
    
}
