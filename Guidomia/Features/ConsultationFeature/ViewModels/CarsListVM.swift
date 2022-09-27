//
//  CarsListVM.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation


class CarsListViewModel {
    
    var carsListService: CarsListServiceProtocol!
    var carsList: [Car] = [] {
        didSet {
            carsViewData = carsList.map { CarListViewData($0) }
        }
    }
    var carsViewData: [CarListViewData] = []
    var bindCarsList: (() -> Void)?
    
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
            self?.bindCarsList?()
        }
        
    }
    
}
