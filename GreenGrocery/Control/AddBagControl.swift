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
    typealias BagClosure = (Int) -> ()
    var closure: BagClosure?
    
    var viewModel: AddBagViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBAction func addToBag(_ sender: Any) {
        self.viewModel = self.viewModel.onAddToBag()
        self.closure?(self.viewModel.stepValue)
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onIncrement()
        self.closure?(self.viewModel.stepValue)
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onDecrement()
        self.closure?(self.viewModel.stepValue)
    }
    
    func configure(using viewModel: AddBagViewModel, addToBag: @escaping BagClosure) {
        self.viewModel = viewModel
        self.addButton.setTitle(viewModel.title, for: .normal)
        self.closure = addToBag
    }
}
