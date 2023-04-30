//
//  UserCompleteDetailsViewControllerPresenter.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation

class UserCompleteDetailsViewControllerPresenter: UserCompleteDetailsViewControllerPresenting{
    
    weak var view: UserCompleteDetailsViewControllerDisplaying?
    var user: UserViewControllerEntity
    var title: String
    
    init(_ view: UserCompleteDetailsViewControllerDisplaying,_ user: UserViewControllerEntity) {
        self.view = view
        self.user = user
        self.title = user.name ?? ""
    }
    
    deinit{
        debugPrint("UserCompleteDetailsViewControllerPresenter init")
    }
    func viewDidLoad() {
        self.view?.setupUI()
        self.view?.reloadData()
    }
}
