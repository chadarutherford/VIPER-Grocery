//
//  HomeModuleBuilder.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class HomeModuleBuilder {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return UIViewController() }
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
