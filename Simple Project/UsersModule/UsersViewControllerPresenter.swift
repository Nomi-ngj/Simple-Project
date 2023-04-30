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
    var users: [UserViewControllerEntity]?
    var title: String = "Users"
    func viewDidLoad() {
        debugPrint("Loaded UsersViewControllerPresenter")
        self.view?.setupUI()
        self.fetchUsers()
    }
    
    func fetchUsers() {
        guard let interactor else {return}
        Task{
            do {
                self.users = try await interactor.fetchUsersRequest()
                self.view?.reloadData()
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    deinit{
        debugPrint("UsersViewControllerPresenter deinit")
    }
}
