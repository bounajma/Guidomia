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
    var viewModel: CarsListViewModel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewsModel()
        self.viewModel.getCarsList()
    }
    
    
    func setupTableView() {
        self.navigationItem.title = "Guidomia"
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.tableView.register(UINib(nibName: CarsListTableCell.cellIdentifier, bundle: Bundle.init(for: CarsListTableCell.self)), forCellReuseIdentifier: CarsListTableCell.cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupViewsModel() {
        self.viewModel.bindCarsList = { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension CarsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.carsViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarsListTableCell.cellIdentifier, for: indexPath) as? CarsListTableCell {
            cell.updateView(self.viewModel.carsViewData[indexPath.section])
            return cell
        }
        return UITableViewCell()
    }
    
}
