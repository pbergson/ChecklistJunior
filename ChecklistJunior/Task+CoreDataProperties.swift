//
//  Task+CoreDataProperties.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/27/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var completedStatus: NSNumber?
    @NSManaged var imageName: String?
    @NSManaged var listIndex: NSNumber?
    @NSManaged var taskName: String?
    @NSManaged var inList: List?

}
