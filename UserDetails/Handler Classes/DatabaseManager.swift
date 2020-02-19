//
//  DatabaseManager.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseManager {
    
    static var sharedInstance = DatabaseManager()
    fileprivate var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    /// To save the user list to database
    ///
    /// - Parameter userList: Array of users
    
    func saveUserList(userList: [[String:Any]]) {
        
        for userDetails in userList {
                        
            let user = User().loadEntity()
            
            user.id         = userDetails["id"] as? String
            user.name       = userDetails["name"] as? String
            user.username   = userDetails["username"] as? String
            user.phone      = userDetails["phone"] as? String
            user.email      = userDetails["email"] as? String
            user.website    = userDetails["website"] as? String
            
            // User Address
            if let userAddress = userDetails["address"] as? [String:Any] {
                
                let address = Address().loadEntity()
                address.street  = userAddress["street"] as? String ?? ""
                address.city    = userAddress["city"] as? String ?? ""
                address.suite   = userAddress["suite"] as? String ?? ""
                address.zipcode = userAddress["zipcode"] as? String ?? ""
                
                // User Geo Coordinate
                if let userGeoCode = userAddress["geo"] as? [String:Any] {
                    
                    let geoCode = GeoCode().loadEntity()
                    geoCode.lalitude    = userGeoCode["lat"] as? String ?? "0.00"
                    geoCode.longitude   = userGeoCode["lng"] as? String ?? "0.00"
                    address.geoCode = geoCode
                    
                }
                user.address = address
            }
            
            // User Company
            if let userCompany = userDetails["company"] as? [String: Any] {
                
                let company = Company().loadEntity()
                company.name        = userCompany["name"] as? String ?? ""
                company.catchPhrase = userCompany["catchPhrase"] as? String ?? ""
                company.bs          = userCompany["bs"] as? String ?? ""
                user.company = company
            }
        }
        
        do{
            try context.save()
        }
        catch {
            print("Error in saving user details")
        }

    }
    
    
    /// To get all users from the database
    ///
    /// - Returns: Returns array of 'Users'
    func getAllUser() -> [User] {
        
        do {
            let fetchRequest:NSFetchRequest = User.fetchRequest()
            let fetchedResults = try context.fetch(fetchRequest)
            
            let userList = fetchedResults.sorted { (userOne, userTwo) -> Bool in
                return userOne.name?.localizedCaseInsensitiveCompare(userTwo.name ?? "") == .orderedAscending
            }
            return userList
        }
        catch {
            return []
        }
    }
    
}

extension Address {
    
    // Full address of the user
    var fullAddress: String? {
        
        var userAddress = ""
        if (self.street?.count)! > 0 {
            userAddress = userAddress + (self.street)! + ", "
        }
        if (self.suite?.count)! > 0 {
            userAddress = userAddress + (self.suite)! + ", "
        }
        if (self.city?.count)! > 0 {
            userAddress = userAddress + (self.city)! + ", "
        }
        if (self.zipcode?.count)! > 0 {
            userAddress = userAddress + "\nZipcode : \((self.zipcode)!)"
        }

        return userAddress
        
    }
    
}

extension Company {
    
    // Company details of the user
    var companyDetails: String? {
        
        var userCompany = ""
        if (self.name?.count)! > 0 {
            userCompany = userCompany + (self.name)! + "\n"
        }
        if (self.catchPhrase?.count)! > 0 {
            userCompany = userCompany + (self.catchPhrase)! + "\n"
        }
        if (self.bs?.count)! > 0 {
            userCompany = userCompany + (self.bs)!
        }

        return userCompany
    }
    
}
