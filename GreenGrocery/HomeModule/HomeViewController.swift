//
//  HomeViewController.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String) -> (())
}

class HomeViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeView {
    func updateTitle(title: String) {
        helloLabel.text = title
    }
}
