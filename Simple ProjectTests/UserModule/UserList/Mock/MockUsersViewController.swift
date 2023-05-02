//
//  MockUsersViewController.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import UIKit
@testable import Simple_Project

class MockUsersViewController:UIViewController, UsersViewControllerDisplaying {
    var presenter: UsersViewControllerPresenting!
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    var setupUIWasCalled = false
    func setupUI() {
        setupUIWasCalled = true
    }
    
    var reloadDataWasCalled = false
    func reloadData() {
        reloadDataWasCalled = true
    }
}
