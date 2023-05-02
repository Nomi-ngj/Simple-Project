//
//  UsersViewControllerRouter.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation
import UIKit

class UsersViewControllerRouter:UsersViewControllerRouting{
    weak var view: UIViewController?
    
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
        guard let viewController = UserCompleteDetailsViewControllerRouter.make(user: userInfo) else {return}
        
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
