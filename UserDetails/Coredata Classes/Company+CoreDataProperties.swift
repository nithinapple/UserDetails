//
//  Company+CoreDataProperties.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var name: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var bs: String?

}
