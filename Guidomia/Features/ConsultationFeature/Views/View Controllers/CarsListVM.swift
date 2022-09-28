//
//  CarsListVM.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation


class CarsListViewModel {
    
    var carsListService: CarsListServiceProtocol!
    var selectedIndex = 0
    var carsList: [Car] = [] {
        didSet {
            updateCarsViewData()
        }
    }
    var carsViewData: [ExpandableCarListViewData] = []
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
    func updateCarsViewData() {
        carsViewData = []
        for i in 0 ..< carsList.count {
            carsViewData.append(CarsListFormatter.formatCarViewData(carsList[i], expanded: i == selectedIndex))
        }
    }
    func didSelectCell(index: Int) {
        self.selectedIndex = index
        updateCarsViewData()
        self.bindCarsList?()
    }
    
}
