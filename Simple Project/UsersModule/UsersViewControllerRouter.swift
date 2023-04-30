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
        let viewController = UsersViewController(nibName: "UsersViewController", bundle: .main)
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
    
    func showUserCompleteDetailScreen(userInfo: UserViewControllerEntity) {
        guard let navigationController = (view as? UIViewController)?.navigationController else {return}
        let viewController = UserCompleteDetailsViewController(nibName: "UserCompleteDetailsViewController", bundle: .main)
        navigationController.pushViewController(viewController, animated: true)
    }
}
