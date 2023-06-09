//
//  MockUsersViewControllerRouter.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
@testable import Simple_Project
import UIKit

class MockUsersViewControllerRouter:UsersViewControllerRouting{
    var view: UIViewController?
    
    static func make() -> UIViewController? {
        
        return UsersViewControllerRouter.make()
    }
    
    var showUserCompleteDetailScreenWasCalled = false
    func showUserCompleteDetailScreen(userInfo: UserViewControllerEntity) {
        showUserCompleteDetailScreenWasCalled = true
    }
    
}
