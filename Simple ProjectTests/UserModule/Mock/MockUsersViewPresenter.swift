//
//  MockUsersViewPresenter.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
@testable import Simple_Project

class MockUsersViewControllerPresenter:UsersViewControllerPresenting{
    var view: UsersViewControllerDisplaying?
    var router: UsersViewControllerRouting?
    var interactor: UsersViewControllerInteracting?
    var users: [UserViewControllerEntity]?
    var title: String = "Users"
    
    var viewDidLoadWasCalled = false
    func viewDidLoad() {
        viewDidLoadWasCalled = true
        fetchUsers()
    }
    
    var fetchUsersSuccessWasCalled = false
    var fetchUsersFailedWasCalled = false
    func fetchUsers() {
        
        if self.users?.count ?? 0 > 0 {
            fetchUsersSuccessWasCalled = true
        }else{
            fetchUsersFailedWasCalled = true
        }
    }
    var didSelectWasCalled = false
    func didSelect(at indexPath: IndexPath) {
        if let user = self.users?.first{
            router?.showUserCompleteDetailScreen(userInfo: user)
        }
        
        didSelectWasCalled = true
    }
}
