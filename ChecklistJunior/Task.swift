//
//  Task.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/27/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }

}
