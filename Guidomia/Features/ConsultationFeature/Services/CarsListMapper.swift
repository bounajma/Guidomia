//
//  CarsMapper.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation

class CarsListMapper {
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data) throws -> [Car] {
        guard let cars = try? JSONDecoder().decode([Car].self, from: data) else {
            throw Error.invalidData
        }
        return cars
    }
    
}
