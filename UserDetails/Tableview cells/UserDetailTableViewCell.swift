//
//  UserDetailTableViewCell.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 18/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet var headertLabel           : UILabel!
    @IBOutlet var contentLabel           : UILabel!
    @IBOutlet var contentTypeImageView   : UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var address: Address? {
        
        didSet {
            self.contentTypeImageView?.image = UIImage(named: "addressIcon")
            self.contentLabel.text = address?.fullAddress
        }
    }

    var company: Company? {
        
        didSet {
            self.contentTypeImageView?.image = UIImage(named: "workIcon")
            self.contentLabel.text = company?.companyDetails
        }
    }

}
