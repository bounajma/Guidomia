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
            viewData.prosText = getAttributed(datas: pros)
        }
        if let cons = car.consList, !cons.isEmpty, expanded {
            viewData.consTitle = "Cons"
            viewData.consText = getAttributed(datas: cons)
        }
        viewData.bottomConstant = expanded ? 20 : 0
        return viewData
        
    }
    
    static func getAttributed(datas: [String?]) -> NSMutableAttributedString {
        
        let attributed = NSMutableAttributedString()
        for data in datas {
            if let data = data, !data.isEmpty {
                attributed.append(NSAttributedString(string: " •", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "AppOrange") ?? UIColor.orange, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                attributed.append(NSAttributedString(string: " \(data)\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .medium)]))
                
            }
        }
        return attributed
    }
    
}
