//
//  UserTableViewCell.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var lblFullName:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var lblPhone:UILabel!

    func config(viewModel:UserViewControllerEntity){
        lblUserName.text = viewModel.username
        lblFullName.text = viewModel.name
        lblEmail.text = viewModel.email
        lblPhone.text = viewModel.phone
    }

}
