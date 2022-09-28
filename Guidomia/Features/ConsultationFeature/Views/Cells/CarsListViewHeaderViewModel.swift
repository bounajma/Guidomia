//
//  CarsListViewHeaderViewModel.swift
//  Guidomia
//
//  Created by Mohamed on 28/09/2022.
//

import Foundation


protocol CarsListViewTableHeaderViewModelProtocol {
    var makeValues: [String] {get set}
    var modelValues: [String] {get set}
}

class CarsListViewTableHeaderViewModel: CarsListViewTableHeaderViewModelProtocol {
    var makeValues: [String]
    var modelValues: [String]
    
    init(makes: [String], models: [String]) {
        self.makeValues = makes
        self.modelValues = models
    }
}
