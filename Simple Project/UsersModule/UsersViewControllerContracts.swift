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
    var tableView: UITableView! {get}
    func setupUI()
    func reloadData()
}

protocol UsersViewControllerPresenting:AnyObject{
    var view:UsersViewControllerDisplaying? {get set}
    var router:UsersViewControllerRouting? {get}
    var interactor: UsersViewControllerInteracting? {get set}
    var users:[UserViewControllerEntity]? {get}
    var title:String {get}
    func viewDidLoad()
    func fetchUsers()
    func didSelect(at indexPath:IndexPath)
}

protocol UsersViewControllerInteracting:AnyObject{
    func fetchUsersRequest() async throws -> [UserViewControllerEntity]
}

protocol UsersViewControllerRouting:AnyObject{
    var view:UsersViewControllerDisplaying? {get}
    static func make() -> UIViewController?
    func showUserCompleteDetailScreen(userInfo:UserViewControllerEntity)
}
