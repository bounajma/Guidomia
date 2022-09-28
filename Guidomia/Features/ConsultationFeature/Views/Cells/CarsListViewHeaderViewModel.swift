//
//  CarsListViewHeaderViewModel.swift
//  Guidomia
//
//  Created by Mohamed on 28/09/2022.
//

import Foundation


enum CarsListFilter {
    case make(String)
    case model(String)
}

protocol CarsListViewTableHeaderViewModelProtocol {
    var makeValues: [String] { get set }
    var modelValues: [String] { get set }
    var selectionHandler: ((CarsListFilter) -> Void)? { get set }
}

class CarsListViewTableHeaderViewModel: CarsListViewTableHeaderViewModelProtocol {
    
    var makeValues: [String]
    var modelValues: [String]
    var selectionHandler: ((CarsListFilter) -> Void)?
    
    init(makes: [String], models: [String]) {
        self.makeValues = makes
        self.modelValues = models
    }
}
