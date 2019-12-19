//
//  HomePresenter.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> ()
}

class HomePresenter {
    weak var view: HomeView?
    var interactor: HomeUseCase
    var router: HomeRouting
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        let homeModel = self.interactor.getTitle()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.updateTitle(title: homeModel.title)
        }
    }
}
