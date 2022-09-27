//
//  CarsListTableCell.swift
//  Guidomia
//
//  Created by Mohamed on 27/09/2022.
//

import UIKit

class CarsListTableCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView(_ car: CarListViewData) {
        self.picture.image = UIImage(named: car.image ?? "bmw")
        self.modelName.text = car.name
        self.price.text = car.price
        self.rating.text = car.rating
    }
    
}
