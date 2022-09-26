//
//  CarsListService.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation

protocol CarsListServiceProtocol {
    func getCarsList(completion: @escaping (Result<[Car], Error>) -> Void)
}

class CarsListService: CarsListServiceProtocol {
    
    var dataLoader: DataLoaderProtocol
    init(loader: DataLoaderProtocol) {
        dataLoader = loader
    }
    
    func getCarsList(completion: @escaping (Result<[Car], Error>) -> Void) {
        
        dataLoader.load(fileName: "car_list", completion: { result in
            switch result {
            case .success(let data):
                do {
                let cars = try CarsListMapper.map(data)
                    completion(.success(cars))
                } catch {
                    log.error("Error Can't load data \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                log.error("Error Can't load data \(error)")
                completion(.failure(error))
            }
        })
        
    }
    
}
