//
//  Task.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/6/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {
    @NSManaged var taskName : String
    @NSManaged var completedStatus: Bool
    @NSManaged var imageURL : String
    @NSManaged var inList : List
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
}