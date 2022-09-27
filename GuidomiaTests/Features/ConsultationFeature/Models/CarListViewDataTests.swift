//
//  CarListViewDataTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import XCTest
@testable import Guidomia

class CarListViewDataTests: XCTestCase {
    
    var sut: CarListViewData?

    override func setUpWithError() throws {
        
        sut = makeSUT()
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_right_initialisation() throws {
        XCTAssertEqual(sut?.name, "Model S")
        XCTAssertEqual(sut?.price, "Price: 80.0k")
        XCTAssertEqual(sut?.image, "modelS")
        XCTAssertEqual(sut?.rating, "⭐⭐⭐⭐⭐")
    }

    func makeSUT() -> CarListViewData {
        let mock = Car()
        mock.model = "Model S"
        mock.marketPrice = 80000
        mock.image = "modelS"
        mock.rating = 5
        
        return CarListViewData(mock)
    }

}
