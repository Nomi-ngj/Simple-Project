//
//  MockUserCompleteDetailsViewController.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 02/05/2023.
//

import Foundation
@testable import Simple_Project
import UIKit

class MockUserCompleteDetailsViewController:UIViewController ,UserCompleteDetailsViewControllerDisplaying{
    var presenter: UserCompleteDetailsViewControllerPresenting!
    
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
