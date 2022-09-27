//
//  JSONDataLoaderTests.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import XCTest
@testable import Guidomia

class JSONDataLoaderTests: XCTestCase {
    
    var loader: JSONDataLoader?
    
    override func setUpWithError() throws {
        loader = makeSUT()
    }

    override func tearDownWithError() throws {
        loader = nil
    }
    
    func test_load_shouldthrowError_whenFileNotFound() {
        
        loader!.load(fileName: "unexistedName") { result in
            if case .success = result {
                XCTFail("This should complete with error ")
            }
        }
    }

    func test_load_shouldCompleteWithData_When_fileIsFOund() {
        
        loader!.load(fileName: "car_list") { result in
            if case .failure = result {
                XCTFail("This should complete with success")
            }
        }
    }

    private func makeSUT() -> JSONDataLoader {
        let sut = JSONDataLoader()
        return sut
    }

}
