//
//  CarsListViewModelTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import XCTest
@testable import Guidomia

class CarsListViewModelTests: XCTestCase {
    

    func testViewModelShouldHaveNotEmptyCarsListwhenServiceSucceeds() {
        
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        XCTAssertEqual(vm.carsList.count, 2)
        XCTAssertEqual(vm.carsList.first?.make, "Mercedes")
    }
    
    func testViewModelShouldInvokeBindingwhenServiceSucceeds() {
        
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        var bindingInvoked = false
        vm.bindCarsList = {
            bindingInvoked = true
        }
        vm.getCarsList()
        mock.getInvocations.first?(.success(makeData()))
        XCTAssertTrue(bindingInvoked)
    }
    
    func testViewModelShouldHaveEmptyCarsListwhenServiceFails() {
        
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.failure(CarsListMapper.Error.invalidData))
        XCTAssertTrue(vm.carsList.isEmpty)
    }
    
    func testViewModelShouldHaveNotEmptyViewDataListwhenServiceSucceeds() {
        
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        XCTAssertEqual(vm.carsViewData.count, 2)
    }
    
    func testViewModelShouldHaveFormattedViewDataListwhenServiceSucceeds() {
        
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        XCTAssertEqual(vm.carsViewData.count, 2)
        XCTAssertEqual(vm.carsViewData.first?.rating, "⭐⭐⭐⭐")
    }
    
    func testDidSelectCellShouldUpdateSelectedIndexVariable() {
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        vm.didSelectCell(index: 2)
        XCTAssertEqual(vm.selectedIndex, 2)
    }
    
    func testDidSelectCellShouldUpdateViewByInvokeBinding() {
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        var didUpdateView = 0
        vm.bindCarsList = {
            didUpdateView += 1
        }
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        vm.didSelectCell(index: 2)
        XCTAssertEqual(didUpdateView, 2)
    }
    
    func testShouldInitTheRightHeaderViewModel() {
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        let headerVM = vm.getHeaderViewModel()
        XCTAssertEqual(headerVM.makeValues.count, 2)
        XCTAssertEqual(headerVM.modelValues.count, 2)
    }
    
    func testShouldApplyRightFiltersAfterUpdateFromHeaderViewModel() {
        let mock = CarsListServiceMock()
        let vm = makeSUT(service: mock)
        vm.getCarsList()
        XCTAssertEqual(mock.getInvocations.count, 1)
        mock.getInvocations.first?(.success(makeData()))
        let headerVM = vm.getHeaderViewModel()
        headerVM.selectionHandler?(.make("Mercedes"))
        XCTAssertEqual(vm.filteredCarsList?.count, 1)
        XCTAssertEqual(vm.filteredCarsList?.first?.model, "Gle")
    }
    
    func makeSUT(service: CarsListServiceProtocol) -> CarsListViewModel {
        let sut = CarsListViewModel(service: service)
        return sut
    }
    
    func makeData() -> [Car] {
        let car1 = Car()
        let car2 = Car()
        
        car1.make = "Mercedes"
        car1.model = "Gle"
        car1.rating = 4
        
        car2.make = "Tesla"
        car2.model = "ModelS"
        car2.rating = 5
        
        return [car1, car2]
    }
    
}
