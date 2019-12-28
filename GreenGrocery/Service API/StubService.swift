//
//  StubService.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/28/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

typealias GroceriesClosure = (GroceryResult?, Error?) -> ()

protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure)
}

class StubService {
    static let shared = StubService()
}

extension StubService: GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
            completion(nil, NSError())
            return
        }
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let groceryResult = try decoder.decode(GroceryResult.self, from: data)
            completion(groceryResult, nil)
        } catch let decodeError {
            print("Error fetching data: \(decodeError.localizedDescription)")
            completion(nil, decodeError)
        }
    }
}
