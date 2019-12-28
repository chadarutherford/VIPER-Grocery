//
//  HomeRouter.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/26/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter: HomeRouting {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}
