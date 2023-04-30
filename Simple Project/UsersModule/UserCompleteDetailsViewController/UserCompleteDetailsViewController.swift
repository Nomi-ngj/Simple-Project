//
//  UserCompleteDetailsViewController.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import UIKit

class UserCompleteDetailsViewController: UIViewController, UserCompleteDetailsViewControllerDisplaying {
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var presenter: UserCompleteDetailsViewControllerPresenting!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    deinit{
        debugPrint("UserCompleteDetailsViewController init")
    }
    
    func setupUI() {
        title = presenter.title
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.tableView.register(UINib(nibName: "UserCompleteDetailsCell", bundle: nibBundle), forCellReuseIdentifier: "UserCompleteDetailsCell")
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension UserCompleteDetailsViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCompleteDetailsCell") as! UserCompleteDetailsCell
        cell.config(viewModel: presenter.user)
        cell.selectionStyle = .none
        return cell
    }
}

