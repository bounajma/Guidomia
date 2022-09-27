//
//  Int+Extensions.swift
//  Guidomia
//
//  Created by Mohamed on 27/09/2022.
//

import Foundation

extension Int {
    
    func getRatingsStars() -> String {
        
        switch self {
        case 1:
            return "⭐"
        case 2:
            return "⭐⭐"
        case 3:
            return "⭐⭐⭐"
        case 4:
            return "⭐⭐⭐⭐"
        default:
            return "⭐⭐⭐⭐⭐"
        }
        
    }
    
}
