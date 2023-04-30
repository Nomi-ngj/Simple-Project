//
//  UserCompleteDetailsViewControllerConstacts.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
import UIKit

protocol UserCompleteDetailsViewControllerDisplaying: AnyObject{
    var presenter: UserCompleteDetailsViewControllerPresenting! {get set}
    var tableView: UITableView! {get}
    func setupUI()
    func reloadData()
}

protocol UserCompleteDetailsViewControllerPresenting:AnyObject{
    var view:UserCompleteDetailsViewControllerDisplaying? {get}
    var user:UserViewControllerEntity {get}
    var title:String { get }
    func viewDidLoad()
}


protocol UserCompleteDetailsViewControllerRouting:AnyObject{
    static func make(user:UserViewControllerEntity) -> UIViewController?
}
