//
//  EntityHelperForTests.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/7/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

struct EntityHelperForTests {
    static func makeManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        let modelURL = NSBundle.mainBundle().URLForResource("ChecklistJuniorModel", withExtension: "momd")
        if let validURL = modelURL {
            let model = NSManagedObjectModel(contentsOfURL: validURL)
            managedObjectContext.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
            return managedObjectContext
        } else {
            print("failed to make managed object context")
            let emptyContext = NSManagedObjectContext()
            return emptyContext
        }
    }
    
    func listWithName(name:String, inContext:NSManagedObjectContext) -> List? {
        let list = List(context: inContext)
        list.listName = name
        return list
    }
    
    func taskWithName(name:String, inContext:NSManagedObjectContext) -> Task {
        let task = Task(context: inContext)
        task.taskName = name
        return task
    }
    
}