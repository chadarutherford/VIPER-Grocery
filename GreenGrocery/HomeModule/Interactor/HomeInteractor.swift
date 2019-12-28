//
//  HomeInteractor.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/26/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClosure)
}

class HomeInteractor {
    var service: GroceriesAPI
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    func getGroceries(completion: (GroceryResult?, Error?) -> ()) {
        self.service.fetchGroceries { result, error in
            if let error = error {
                completion(nil, error)
            }
            
            guard let result = result else {
                completion(nil, NSError())
                return
            }
            
            completion(result, nil)
        }
    }
}
