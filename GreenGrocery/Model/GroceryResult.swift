//
//  GroceryResult.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/28/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

struct GroceryResult: Codable {
    let groceries: [Grocery]
}

struct Grocery: Codable {
    let skuID: String
    let title: String
    let image: String
    let details: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case skuID = "sku-id"
        case title
        case image = "product_image"
        case details
        case price
    }
}
