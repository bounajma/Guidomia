//
//  CarsListVM.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation


class CarsListViewModel {
    
    var carsListService: CarsListServiceProtocol!
    var carsList: [Car]? {
        didSet {
            if let list = carsList {
                bindTownList?(list.map { CarListViewData($0) })
            }
        }
    }
    var bindTownList: (([CarListViewData]) -> Void)?
    
    init(service: CarsListServiceProtocol) {
        self.carsListService = service
    }
    
    func getCarsList() {
        
        self.carsListService.getCarsList { [weak self] result in
            switch result {
            case .success(let list):
                self?.carsList = list
            case.failure(_):
                self?.carsList = []
            }
        }
        
    }
    
}
