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
            updateCarsViewData(self.carsList)
        }
    }
    var filteredCarsList: [Car]?
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
    func updateCarsViewData(_ list: [Car]) {
        carsViewData = []
        for i in 0 ..< list.count {
            carsViewData.append(CarsListFormatter.formatCarViewData(list[i], expanded: i == selectedIndex))
        }
    }
    func didSelectCell(index: Int) {
        self.selectedIndex = index
        updateCarsViewData(self.filteredCarsList ?? self.carsList)
        self.bindCarsList?()
    }
    
    func getHeaderViewModel() -> CarsListViewTableHeaderViewModelProtocol {
        let makes = self.carsList.map { $0.make ?? "" }.filter { !$0.isEmpty }
        let models = self.carsList.map { $0.model ?? "" }.filter { !$0.isEmpty }
        let vm = CarsListViewTableHeaderViewModel(makes: makes, models: models)
        vm.selectionHandler = { [weak self] filter in
            self?.filterCarsList(filter: filter)
            self?.updateCarsViewData(self?.filteredCarsList ?? [])
            self?.bindCarsList?()
        }
        return vm
    }
    
    func filterCarsList(filter: CarsListFilter) {
        
        switch filter {
        case .make(let text):
            self.filteredCarsList = carsList.filter { $0.make == text}
            
        case .model(let text):
            self.filteredCarsList = carsList.filter { $0.model == text}
        }
    }
    
}
