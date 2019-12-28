//
//  HomeViewController.swift
//  GreenGrocery
//
//  Created by Chad Rutherford on 12/19/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresentation?
    var dataSource = [GroceryItemViewModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let viewModel = AddBagViewModel(title: "ADD TO BAG", stepValue: 0)
        control.configure(using: viewModel)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.tableView.register(UINib(nibName: "GroceryItemCell", bundle: nil), forCellReuseIdentifier: Cells.groceryCell)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension HomeViewController: HomeView {
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        self.dataSource = groceriesList
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.groceryCell, for: indexPath) as? GroceryItemCell else { return UITableViewCell() }
        let viewModel = dataSource[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
