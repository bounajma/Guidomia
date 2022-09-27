//
//  JSONDataLoaderMock.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import Foundation

@testable import Guidomia


class JSONDataLoaderMock: DataLoaderProtocol {
    
    enum DataLoaderError: Swift.Error {
        case fileNotFound
    }
    
    var loadInvokations: [(Result<Data, Error>) -> Void] = []
    
    func load(fileName: String, completion: @escaping (Result<Data, Error>) -> Void) {
        self.loadInvokations.append(completion)
    }
}
