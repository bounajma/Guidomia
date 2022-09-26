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
    var marketPrice: Double = 0.0
    var customerPrice: Double = 0.0
    var image: String?
    var rating: Int = 0
    var consList: [String?]
    var prosList: [String?]
}
