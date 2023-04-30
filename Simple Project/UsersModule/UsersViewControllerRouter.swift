//
//  UsersViewControllerRouter.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation
import UIKit

class UsersViewControllerRouter:UsersViewControllerRouting{
    var view: UsersViewControllerDisplaying?
    
    static func make() -> UIViewController? {
        let viewController = UsersViewController(nibName: "UsersViewController", bundle: Bundle.main)
        let presenter = UsersViewControllerPresenter()
        let router = UsersViewControllerRouter()
        let interactor = UsersViewControllerInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        return viewController
    }
}
