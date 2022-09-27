//
//  AppCoordinator.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import Foundation
import UIKit


class AppCoordinator {
    
    var window: UIWindow?
    
    //TODO: Use a  DIContiner for dependency injection to make this class testable
    let consultation = ConsultationCoordinator()
    
    func start(window: UIWindow?) {
       
        self.window = window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.startConsultation()
        self.window?.rootViewController = self.consultation.navController
        self.window?.makeKeyAndVisible()
    }
    
    func startConsultation () {
        //MARK: DependencyInjection
        let carsVC = CarsListVC()
        
        let carsService = CarsListService(loader: JSONDataLoader())
        let carsVM = CarsListViewModel(service: carsService)
        carsVC.viewModel = carsVM
        self.consultation.carsVC = carsVC
    
        
        self.consultation.start()
    }
    
    
    
}


