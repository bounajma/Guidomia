//
//  CarsListMapperTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import XCTest
@testable import Guidomia

class CarsListMapperTests: XCTestCase {

        
    func testMappingDataInTheWrightWay() {
        let cars = try? CarsListMapper.map(makeData())
        XCTAssertNotNil(cars)
        XCTAssertEqual(cars?.count, 4)
        let car = cars?.first
        XCTAssertNotNil(car)
        XCTAssertEqual(car?.make, "Land Rover")
        XCTAssertEqual(car?.marketPrice, 125000.0)
        XCTAssertEqual(car?.customerPrice, 120000.0)
        XCTAssertEqual(car?.model, "Range Rover")
        XCTAssertEqual(car?.rating, 3)
        XCTAssertEqual(car?.image, "range")
        XCTAssertNotNil(car?.consList)
        XCTAssertEqual(car?.consList?.count, 1)
        XCTAssertEqual(car?.consList?.first, "Bad direction")
        XCTAssertNotNil(car?.prosList)
        XCTAssertEqual(car?.prosList?.count, 2)
        XCTAssertEqual(car?.prosList?.first, "You can go everywhere")
    }
    
    func testShouldThrowInvalidDataWhenDataIsInvalid() {
        do {
            let cars = try CarsListMapper.map(makeInvalidData())
            XCTAssertEqual(cars.count, 0)
        } catch {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as? CarsListMapper.Error, CarsListMapper.Error.invalidData)
        }
        
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
