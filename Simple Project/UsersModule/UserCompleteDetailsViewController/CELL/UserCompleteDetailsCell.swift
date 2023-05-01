//
//  UserCompleteDetailsCell.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import UIKit

class UserCompleteDetailsCell: UITableViewCell {
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var lblFullName:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var lblPhone:UILabel!
    @IBOutlet weak var lblAddress:UILabel!
    @IBOutlet weak var lblCompany:UILabel!
    @IBOutlet weak var lblDesignation:UILabel!
    @IBOutlet weak var lblWebsite:UILabel!

    func config(viewModel:UserViewControllerEntity){
        lblUserName.text = viewModel.username
        lblFullName.text = viewModel.name
        lblEmail.text = viewModel.email
        lblPhone.text = viewModel.phone
        
        lblAddress.text = viewModel.address.completeAddress
        lblCompany.text = viewModel.company.name
        lblDesignation.text = viewModel.company.bs
        lblWebsite.text = viewModel.website
    }
}
