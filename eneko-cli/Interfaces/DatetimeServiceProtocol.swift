//
//  DatetimeServiceProtocol.swift
//  eneko
//
//  Created by Eneko on 27/7/21.
//

import Foundation

protocol DatetimeServiceProtocol {
    
    func getCurrentDate(_ completion: (Result<Date, Error>) -> Void)
    
}
