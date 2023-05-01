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
    var users: [UserViewControllerEntity]? = [MockUserEntity.mockUser]
    var title: String = "Users"
    
    var viewDidLoadWasCalled = false
    func viewDidLoad() {
        viewDidLoadWasCalled = true
    }
    
    var fetchUsersSuccessWasCalled = false
    var fetchUsersFailedWasCalled = false
    func fetchUsers() {
        Task{
            do{
                let task = try await interactor?.fetchUsersRequest()
                self.fetchUsersSuccessWasCalled = true
            }catch{
                fetchUsersFailedWasCalled = true
            }
        }
    }
    var didSelectWasCalled = false
    func didSelect(at indexPath: IndexPath) {
        didSelectWasCalled = true
    }
}
