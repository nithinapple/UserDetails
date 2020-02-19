//
//  UserDetailViewController.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 18/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet var tableview         : UITableView!
    @IBOutlet var fullnameLabel     : UILabel!
    @IBOutlet var usernameLabel     : UILabel!

    public var userDetails: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "User Details"
        
        fullnameLabel?.text = userDetails?.name ?? "Unavailable"
        usernameLabel?.text = "@\(userDetails?.username ?? "unavailable")"
        
    }
    
}

extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailHeaderCell") as! UserDetailTableViewCell
        
        if section == 0 {
            cell.headertLabel?.text = "Info"
        }
        else if section == 1 {
            cell.headertLabel?.text = "Address"
        }
        else {
            cell.headertLabel?.text = "Work"
        }
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailContentCell") as! UserDetailTableViewCell
        
        switch indexPath.section {
            
        case 0:
            
            if indexPath.row == 0 {
                cell.contentTypeImageView?.image = UIImage(named: "phoneIcon")
                cell.contentLabel?.text = userDetails?.phone ?? "Unavailable"
            }
            else if indexPath.row == 1 {
                cell.contentTypeImageView?.image = UIImage(named: "emailIcon")
                cell.contentLabel?.text = userDetails?.email ?? "Unavailable"
            }
            else {
                cell.contentTypeImageView?.image = UIImage(named: "websiteIcon")
                cell.contentLabel?.text = userDetails?.website ?? "Unavailable"
            }
            
            break
            
        case 1:
            
            cell.address = userDetails?.address
            break
            
        case 2:
            
            cell.company = userDetails?.company
            break

        default:
            break
            
        }
        
        return cell

    }
}


@IBDesignable
class UserProfileImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}


