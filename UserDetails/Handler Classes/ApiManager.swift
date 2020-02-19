//
//  ApiManager.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//

import Foundation

class ApiManager {
    
    static var sharedInstance = ApiManager()

    
    /// To fetch the user list
    ///
    /// - Parameter completion: A completion handler for call back after the list is fetched
    
    func fetchUserList(completion: @escaping (AnyObject?, NSError?) -> Void) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    completion(nil, error as NSError)
                }
                
                if let data = data {
                    
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        completion(jsonData as AnyObject, nil)
                    }
                    catch let error as NSError {
                        
                        print("Failed \(error.userInfo)")
                        completion(nil, error as NSError)
                    }
                }
            }
            task.resume()
            
        }
    }
}
