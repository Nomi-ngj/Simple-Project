//
//  UserCompleteDetailsViewControllerRouter.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
import UIKit

class UserCompleteDetailsViewControllerRouter:UserCompleteDetailsViewControllerRouting{
    
    static func make(user: UserViewControllerEntity) -> UIViewController? {
        let viewController = UserCompleteDetailsViewController(nibName: "UserCompleteDetailsViewController", bundle: .main)
        let presenter = UserCompleteDetailsViewControllerPresenter(viewController, user)
        
        viewController.presenter = presenter
        return viewController
    }
    
    
}
