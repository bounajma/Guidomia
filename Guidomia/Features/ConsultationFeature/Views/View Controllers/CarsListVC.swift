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
        self.navigationItem.title = "Guidomia"
        setupTableView()
        setupViewsModel()
        self.viewModel.getCarsList()
    }
    
    
    func setupTableView() {
        
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.tableView.register(UINib(nibName: ExpandableCarsListTableCell.cellIdentifier, bundle: Bundle.init(for: ExpandableCarsListTableCell.self)), forCellReuseIdentifier: ExpandableCarsListTableCell.cellIdentifier)
        self.tableView.register(UINib(nibName: CarsListTableViewFooter.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CarsListTableViewFooter.identifier)
        self.tableView.register(UINib(nibName: CarsListTableViewHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CarsListTableViewHeader.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupViewsModel() {
        self.viewModel.bindCarsList = { [weak self] in
            self?.view.endEditing(true)
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCarsListTableCell.cellIdentifier, for: indexPath) as? ExpandableCarsListTableCell {
            cell.updateView(self.viewModel.carsViewData[indexPath.section])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarsListTableViewFooter.identifier) as? CarsListTableViewFooter {
            return view
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0, let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarsListTableViewHeader.identifier) as? CarsListTableViewHeader {
            view.setupViewModel(viewModel: self.viewModel.getHeaderViewModel())
            return view
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 500 : 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didSelectCell(index: indexPath.section)
    }
}
