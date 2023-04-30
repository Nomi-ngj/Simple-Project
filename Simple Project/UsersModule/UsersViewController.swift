//
//  UsersViewController.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import UIKit

class UsersViewController: UIViewController, UsersViewControllerDisplaying {
    var presenter: UsersViewControllerPresenting!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    deinit{
        debugPrint("UsersViewController deinit")
    }
    
    func setupUI() {
        debugPrint("setupUI")
    }
    
    func reloadData() {
        debugPrint("reloadData")
    }
}
