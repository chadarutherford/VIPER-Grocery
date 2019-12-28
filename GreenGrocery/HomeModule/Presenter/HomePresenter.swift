//
//  HomePresenter.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/26/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
}

class HomePresenter: HomePresentation {
    weak var view: HomeView?
    var router: HomeRouting?
    var interactor: HomeUseCase?
    
    init(view: HomeView, router: HomeRouting, interactor: HomeUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter {
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async {
            self.interactor?.getGroceries { result, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                
                guard let result = result else { return }
                let groceryList = result.groceries.compactMap { GroceryItemViewModel(using: $0) }
                DispatchQueue.main.async {
                self.view?.updateGroceries(groceriesList: groceryList)
                }
            }
        }
    }
}
