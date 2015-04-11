//
//  List.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/1/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

class List: NSManagedObject {
    @NSManaged var listName : String
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entityForName("List", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
}