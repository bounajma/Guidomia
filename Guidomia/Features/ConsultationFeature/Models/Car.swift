//
//  Car.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation

class Car: Codable {
    var make: String?
    var model: String?
    var marketPrice: Double
    var customerPrice: Double
    var image: String?
    var rating: Int
    var consList: [String?]
    var prosList: [String?]
}
