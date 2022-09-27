//
//  File.swift
//  GuidomiaTests
//
//  Created by Mohamed on 27/09/2022.
//

import Foundation
@testable import Guidomia

class CarsListServiceMock: CarsListServiceProtocol {
    var getInvocations: [(Result<[Car], Error>) -> Void] = []
    func getCarsList(completion: @escaping (Result<[Car], Error>) -> Void) {
        self.getInvocations.append(completion)
    }
    
}
