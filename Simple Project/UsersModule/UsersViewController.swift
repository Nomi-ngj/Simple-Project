//
//  UsersViewController.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import UIKit

class UsersViewController: UIViewController, UsersViewControllerDisplaying {
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    
    var presenter: UsersViewControllerPresenting!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    deinit{
        debugPrint("UsersViewController deinit")
    }
    
    func setupUI() {
        title = presenter.title
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nibBundle), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UsersViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        if let user = presenter.users?[indexPath.row]{
            cell.config(viewModel: user)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
