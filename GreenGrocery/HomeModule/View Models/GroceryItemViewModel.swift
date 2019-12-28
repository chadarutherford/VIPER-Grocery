//
//  GroceryItemViewModel.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/28/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

struct GroceryItemViewModel {
    let title: String
    let details: String
    let image: String
    let price: String
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    init(using groceryModel: Grocery) {
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = numberFormatter.string(from: NSNumber(value: groceryModel.price)) ?? "$0.00"
    }
}
