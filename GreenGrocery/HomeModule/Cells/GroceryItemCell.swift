//
//  TableViewCell.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/26/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class GroceryItemCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel: GroceryItemViewModel? {
        didSet {
            configure()
        }
    }
    
    private func configure() {
        guard let viewModel = viewModel else { return }
        self.titleLabel.text = viewModel.title
        self.productImageView.image = UIImage(named: viewModel.image)
        self.detailsLabel.text = viewModel.details
        self.priceLabel.text = viewModel.price
    }
}
