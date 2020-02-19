//
//  Address+CoreDataClass.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Address)
public class Address: NSManagedObject {

    func loadEntity() -> Address {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Address", in: context)!
        return NSManagedObject.init(entity: entity, insertInto: context) as! Address
    }

}
