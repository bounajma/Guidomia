//
//  CarsListVC.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import UIKit

protocol CarsListVCDelegate: NSObjectProtocol {
    
}

protocol CarsListView: UIViewController {
    var delegate: CarsListVCDelegate? { get set }
    
}

class CarsListVC: UIViewController, CarsListView {
    
    var delegate: CarsListVCDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
