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
    
    var viewModel: CarsListViewTableHeaderViewModelProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCornerRadius()
    }
    
    func setupViewModel(viewModel: CarsListViewTableHeaderViewModelProtocol) {
        self.viewModel = viewModel
        setupTextFields()
    }
    
    func setupCornerRadius() {
        self.filtersView.layer.cornerRadius = 6
    }
    
    func setupTextFields() {
        let makePicker = UIPickerView()
        makePicker.tag = 1
        let modelPicker = UIPickerView()
        modelPicker.tag = 2
        makePicker.delegate = self
        makePicker.dataSource = self
        modelPicker.delegate = self
        modelPicker.dataSource = self
        self.makeTextField.inputView = makePicker
        self.ModelTextField.inputView = modelPicker
    }
    
}

extension CarsListTableViewHeader: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView.tag == 1 ?  self.viewModel.makeValues.count : self.viewModel.modelValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView.tag == 1 ? self.viewModel.makeValues[row] : self.viewModel.modelValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let text = self.viewModel.makeValues[row]
            self.makeTextField.text = text
            self.ModelTextField.text = nil
            self.viewModel.selectionHandler?(.make(text))
        } else {
            let text = self.viewModel.modelValues[row]
            self.makeTextField.text = nil
            self.ModelTextField.text = text
            self.viewModel.selectionHandler?(.model(text))
        }
    }
}
