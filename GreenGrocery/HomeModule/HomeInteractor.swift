//
//  HomeInteractor.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeInteractor { }

extension HomeInteractor: HomeUseCase {
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello V.I.P.E.R.!")
    }
}
