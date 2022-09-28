//
//  ExpandableCarsListTableCell.swift
//  Guidomia
//
//  Created by Mohamed on 28/09/2022.
//

import UIKit

class ExpandableCarsListTableCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var prosTitle: UILabel!
    @IBOutlet weak var prosValue: UILabel!
    @IBOutlet weak var consTitle: UILabel!
    @IBOutlet weak var consValue: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView(_ car: ExpandableCarListViewData) {
        self.picture.image = UIImage(named: car.image ?? "bmw")
        self.modelName.text = car.name
        self.price.text = car.price
        self.rating.text = car.rating
        self.prosTitle.text = car.prosTitle
        self.prosValue.attributedText = car.prosText
        self.consTitle.text = car.consTitle
        self.consValue.attributedText = car.consText
        self.bottomConstraint.constant = car.bottomConstant ?? 0
    }
    
}
