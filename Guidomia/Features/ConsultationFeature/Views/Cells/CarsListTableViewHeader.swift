//
//  CarsListTableViewHeader.swift
//  Guidomia
//
//  Created by Mohamed on 28/09/2022.
//

import UIKit

class CarsListTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var ModelTextField: UITextField!
    @IBOutlet weak var filtersView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        self.filtersView.layer.cornerRadius = 6
    }
    
}
