//
//  UserListTableViewCell.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 18/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet var containerView     : UIView!
    @IBOutlet var usernameLabel     : UILabel!
    @IBOutlet var phoneNumberLabel  : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
        self.contentView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        self.containerView?.backgroundColor = UIColor.white
        self.containerView?.layer.shadowColor = UIColor.black.cgColor
        self.containerView?.layer.shadowOffset = CGSize(width: 0, height: 0.75)
        self.containerView?.layer.shadowOpacity = 0.26
        self.containerView?.layer.shadowRadius = 1.2
        self.containerView?.layer.cornerRadius = 4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var user: User? {
        
        didSet {
            self.usernameLabel?.text = user?.name ?? "Unavailable"
            self.phoneNumberLabel?.text = user?.phone ?? "Unavailable"
        }
    }
    
    
}
