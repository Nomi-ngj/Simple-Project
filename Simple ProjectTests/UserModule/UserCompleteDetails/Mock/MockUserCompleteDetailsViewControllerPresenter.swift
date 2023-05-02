//
//  MockUserCompleteDetailsViewControllerPresenter.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 02/05/2023.
//

import Foundation
@testable import Simple_Project

class MockUserCompleteDetailsViewControllerPresenter:UserCompleteDetailsViewControllerPresenting{
    
    var view: UserCompleteDetailsViewControllerDisplaying?
    var user: UserViewControllerEntity
    var title: String
    
    init(user: UserViewControllerEntity) {
        self.user = user
        self.title = user.name
    }
    
    func viewDidLoad() {
        self.view?.setupUI()
        self.view?.reloadData()
    }
}
