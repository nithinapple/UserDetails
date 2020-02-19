//
//  GeoCode+CoreDataProperties.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//
//

import Foundation
import CoreData

extension GeoCode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoCode> {
        return NSFetchRequest<GeoCode>(entityName: "GeoCode")
    }

    @NSManaged public var lalitude: String?
    @NSManaged public var longitude: String?

}
