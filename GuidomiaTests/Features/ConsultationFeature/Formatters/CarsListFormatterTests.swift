//
//  CarsListFormatterTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 28/09/2022.
//

import XCTest
@testable import Guidomia

class CarsListFormatterTests: XCTestCase {

    func testFormatterShouldShowInfoForExpandableView() {
        let viewData = CarsListFormatter.formatCarViewData(makeData(), expanded: true)
        XCTAssertNotNil(viewData.prosTitle)
        XCTAssertNotNil(viewData.consTitle)
        XCTAssertNotNil(viewData.prosText)
        XCTAssertNotNil(viewData.consText)
        XCTAssertEqual(viewData.bottomConstant, 20)
    }
    
    func testFormatterShouldHideInfoForNonExpandableView() {
        let viewData = CarsListFormatter.formatCarViewData(makeData(), expanded: false)
        XCTAssertNil(viewData.prosTitle)
        XCTAssertNil(viewData.consTitle)
        XCTAssertNil(viewData.prosText)
        XCTAssertNil(viewData.consText)
        XCTAssertEqual(viewData.bottomConstant, 0)
    }

    
    func makeData() -> Car {
        let mock = Car()
        mock.model = "Model S"
        mock.marketPrice = 80000
        mock.image = "modelS"
        mock.rating = 5
        mock.prosList = ["some pros"]
        mock.consList = ["some cons"]
        return mock
    }
    
    
}

