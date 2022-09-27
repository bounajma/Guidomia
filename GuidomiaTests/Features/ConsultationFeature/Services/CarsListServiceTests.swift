//
//  CarsListServiceTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import XCTest
@testable import Guidomia

class CarsListServiceTests: XCTestCase {

    func testShouldHaveCarsListWhenLoaderSucceed() {
        let mock = JSONDataLoaderMock()
        let service = makeSUT(loader: mock)
        
        var cars = [Car]()
        var completionInvoked = false
        service.getCarsList { result in
            if case .success(let list) = result {
                cars = list
                completionInvoked = true
            }
        }
        mock.loadInvokations.first?(.success(makeData()))
        XCTAssertTrue(completionInvoked)
        XCTAssertFalse(cars.isEmpty)
    }
    
    func testShouldFailWhenDataLoaderFails() {
        let mock = JSONDataLoaderMock()
        let service = makeSUT(loader: mock)
        var err: Error? = nil
        var completionInvoked = false
        service.getCarsList { result in
            if case .failure(let error) = result {
                err = error
                completionInvoked = true
            }
        }
        mock.loadInvokations.first?(.failure(JSONDataLoaderMock.DataLoaderError.fileNotFound))
        XCTAssertNotNil(err)
        XCTAssertTrue(err is JSONDataLoaderMock.DataLoaderError)
        XCTAssertTrue(completionInvoked)
    }
    
    func testShoudFailWhenMapperFails() {
        let mock = JSONDataLoaderMock()
        let service = makeSUT(loader: mock)
        var err: Error? = nil
        var completionInvoked = false
        service.getCarsList { result in
            if case .failure(let error) = result {
                err = error
                completionInvoked = true
            }
        }
        mock.loadInvokations.first?(.success(makeInvalidData()))
        XCTAssertNotNil(err)
        XCTAssertTrue(err is CarsListMapper.Error)
        XCTAssertTrue(completionInvoked)
    }
    
    private func makeSUT(loader: DataLoaderProtocol) -> CarsListService {
        
        let sut = CarsListService(loader: loader)
        return sut
    }
    
    private func makeData() -> Data {
        return try! Data(contentsOf:
                        URL(fileURLWithPath:
                                Bundle(for: type(of: self)).path(forResource: "test_data", ofType: "json")!
                           )
        )
    }
    private func makeInvalidData() -> Data {
        return try! Data(contentsOf:
                        URL(fileURLWithPath:
                                Bundle(for: type(of: self)).path(forResource: "invalid_data", ofType: "json")!
                           )
        )
    }

}
