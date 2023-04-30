//
//  UsersViewControllerContracts.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation
import UIKit

protocol UsersViewControllerDisplaying: AnyObject{
    var presenter: UsersViewControllerPresenting! {get set}
    func setupUI()
    func reloadData()
}

protocol UsersViewControllerPresenting:AnyObject{
    var view:UsersViewControllerDisplaying? {get set}
    var router:UsersViewControllerRouting? {get}
    var interactor: UsersViewControllerInteracting? {get set}
    func viewDidLoad()
    func loadUsers()
}

protocol UsersViewControllerInteracting:AnyObject{
    func loadUsers()
}

protocol UsersViewControllerRouting:AnyObject{
    var view:UsersViewControllerDisplaying? {get}
    static func make() -> UIViewController?
}
