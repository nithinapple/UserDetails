//
//  GeoCode+CoreDataClass.swift
//  UserDetails
//
//  Created by Nithin Sasankan on 19/02/20.
//  Copyright © 2020 Nithin S. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(GeoCode)
public class GeoCode: NSManagedObject {

    func loadEntity() -> GeoCode {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "GeoCode", in: context)!
        return NSManagedObject.init(entity: entity, insertInto: context) as! GeoCode
    }

}
