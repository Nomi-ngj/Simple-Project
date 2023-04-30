//
//  UserCompleteDetailsViewController.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import UIKit

class UserCompleteDetailsViewController: UIViewController, UserCompleteDetailsViewControllerDisplaying {
    var presenter: UserCompleteDetailsViewControllerPresenting!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    deinit{
        debugPrint("UserCompleteDetailsViewController init")
    }
    
    func setupUI() {
        
    }
    
    func reloadData() {
        
    }
}
