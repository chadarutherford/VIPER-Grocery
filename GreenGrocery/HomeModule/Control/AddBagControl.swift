//
//  AddBagControl.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/20/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class AddBagControl: UIControl, ViewLoadable {
    
    static var nibName: String = "AddBagControl"
    
    var viewModel: AddBagViewModel! {
        didSet {
            stepLabel.text = "\(viewModel.stepValue)"
            addButton.isHidden = (viewModel.showStepper)
            plusButton.isHidden = !(viewModel.showStepper)
            minusButton.isHidden = !(viewModel.showStepper)
            stepLabel.isHidden = !(viewModel.showStepper)
        }
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBAction func addToBag(_ sender: Any) {
        self.viewModel = self.viewModel.onAddToBag()
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onIncrement()    }
    
    @IBAction func decrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onDecrement()
    }
    
    func configure(using viewModel: AddBagViewModel) {
        self.viewModel = viewModel
        self.addButton.setTitle(viewModel.title, for: .normal)
    }
}
