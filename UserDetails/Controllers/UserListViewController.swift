//
//  UserListViewController.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 18/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet var tableview             : UITableView!
    @IBOutlet var activityIndicator     : UIActivityIndicatorView!
    
    var userArray = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fetchUserList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchUserList() {
        
        userArray = DatabaseManager.sharedInstance.getAllUser()
        
        if userArray.count == 0 {
            
            activityIndicator.startAnimating()
            ApiManager.sharedInstance.fetchUserList { (response, error) in
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    
                    if let error = error {
                        self.showAlert(title: "User List", message: "Failed to fetch user list. Please try again.")
                        print("Failed to fetch data. \(error.localizedDescription)")
                        return
                    }
                    
                    if let response = response {
                        DatabaseManager.sharedInstance.saveUserList(userList: response as! [[String : Any]])
                        self.userArray = DatabaseManager.sharedInstance.getAllUser()
                        self.tableview.reloadData()
                    }
                }
            }
        }
        else {
            tableview.reloadData()
        }
    }

}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as! UserListTableViewCell
        cell.user = userArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let userDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        userDetailVC.userDetails = userArray[indexPath.row]
        self.navigationController?.pushViewController(userDetailVC, animated: true)
        
    }
    
}


extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        
        let alertView = UIAlertController(title: title ?? "Alert", message: message ?? "Something went wrong. Please try again.", preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
        }))
        
        self.present(alertView, animated: true, completion: nil)
    }
    
}
