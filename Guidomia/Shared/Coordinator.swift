//
//  Coordinator.swift
//  Guidomia
//
//  Created by Mohamed on 27/09/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navController: UINavigationController { get set }
    func start()
}
