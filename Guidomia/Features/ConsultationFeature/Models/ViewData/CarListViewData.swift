//
//  CarListViewData.swift
//  Guidomia
//
//  Created by Mohamed Bounajma on 27/9/2022.
//

import Foundation

class CarListViewData {
    
    var name: String?
    var price: String?
    var rating: Int = 0
    var image: String?
    
    init(_ car: Car) {
        self.name = car.model
        self.price = "Price: \(car.marketPrice.getFormattedPrice())"
        self.image = car.image
        self.rating = car.rating
    }
    
}
