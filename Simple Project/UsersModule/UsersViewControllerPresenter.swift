//
//  UsersViewControllerPresenter.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation

class UsersViewControllerPresenter:UsersViewControllerPresenting{
    weak var view: UsersViewControllerDisplaying?
    
    var router: UsersViewControllerRouting?
    
    var interactor: UsersViewControllerInteracting?
    
    func viewDidLoad() {
        debugPrint("Loaded UsersViewControllerPresenter")
    }
    
    func loadUsers() {
        
    }
    
    deinit{
        debugPrint("UsersViewControllerPresenter deinit")
    }
}
