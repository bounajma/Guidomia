//
//  ConsultationCoordinator.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import UIKit


class ConsultationCoordinator: NSObject, Coordinator {
    
    var navController: UINavigationController = UINavigationController()
    
    //MARK: Cars List
    var carsVC: CarsListView?
    
    
    func start() {
        self.navController.navigationBar.prefersLargeTitles = true
        self.navController.navigationItem.largeTitleDisplayMode = .automatic
        self.navController.navigationBar.sizeToFit()
        self.navController.navigationBar.isTranslucent = false
        self.carsVC?.delegate = self
        self.navController = UINavigationController(rootViewController: self.carsVC ?? UIViewController())
    }
    
}

extension ConsultationCoordinator: CarsListVCDelegate {
    
}
