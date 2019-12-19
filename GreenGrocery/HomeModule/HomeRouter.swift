//
//  HomeRouter.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension HomeRouter: HomeRouting {
    
}
