//
//  Company+CoreDataClass.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Company)
public class Company: NSManagedObject {

    func loadEntity() -> Company {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Company", in: context)!
        return NSManagedObject.init(entity: entity, insertInto: context) as! Company
    }

}
