//
//  Double+Extensions.swift
//  Guidomia
//
//  Created by Mohamed Bounajma on 27/9/2022.
//

import Foundation


extension Double {
    
    func getFormattedPrice() -> String {
        return "\(self / 1000)k" 
    }
    
}
