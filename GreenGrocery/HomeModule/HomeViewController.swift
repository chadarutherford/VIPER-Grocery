//
//  HomeViewController.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    
    lazy var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let viewModel = AddBagViewModel(title: "ADD TO BAG", stepValue: 0)
        control.configure(using: viewModel) { stepValue in
            print("Current step value: \(stepValue)")
        }
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerStackView.addArrangedSubview(addBagControl)
    }
}
