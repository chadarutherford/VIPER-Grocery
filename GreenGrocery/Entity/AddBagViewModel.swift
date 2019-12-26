//
//  AddBagViewModel.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/26/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

struct AddBagViewModel {
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(title: String, stepValue: Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddBagViewModel {
    func onAddToBag() -> AddBagViewModel {
        return AddBagViewModel(title: self.title, stepValue: 1)
    }
    
    func onIncrement() -> AddBagViewModel {
        guard stepValue < 10 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> AddBagViewModel {
        guard stepValue > 0 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue - 1)
    }
}
