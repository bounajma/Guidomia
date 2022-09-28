//
//  CarsListFormatter.swift
//  Guidomia
//
//  Created by Mohamed on 28/09/2022.
//

import Foundation
import UIKit

class CarsListFormatter {
    
    static func formatCarViewData(_ car: Car, expanded: Bool) -> ExpandableCarListViewData {
        
        let viewData = ExpandableCarListViewData()
        viewData.name = car.model
        viewData.price = "Price: \(car.marketPrice.getFormattedPrice())"
        viewData.image = car.image
        viewData.rating = car.rating.getRatingsStars()
        if let pros = car.prosList, !pros.isEmpty, expanded {
            viewData.prosTitle = "Pros"
            let prosAttributed = NSMutableAttributedString()
            for pro in pros {
                if let pro = pro, !pro.isEmpty {
                    prosAttributed.append(NSAttributedString(string: " •", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "AppOrange") ?? UIColor.orange, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                    prosAttributed.append(NSAttributedString(string: " \(pro)\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                    
                }
            }
            viewData.prosText = prosAttributed
        }
        if let cons = car.consList, !cons.isEmpty, expanded {
            viewData.consTitle = "Cons"
            let consAttributed = NSMutableAttributedString()
            for con in cons {
                if let con = con, !con.isEmpty {
                    consAttributed.append(NSAttributedString(string: " •", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "AppOrange") ?? UIColor.orange, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                    consAttributed.append(NSAttributedString(string: " \(con)\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                    
                }
            }
            viewData.consText = consAttributed
        }
        viewData.bottomConstant = expanded ? 20 : 0
        return viewData
        
    }
    
}
