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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
