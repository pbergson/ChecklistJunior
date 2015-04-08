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
            //TODO fix unwrapping
        }
        
        managedObjectContext.persistentStoreCoordinator?.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil);
            return managedObjectContext
    }
    
    func listWithName(name:String, inContext:NSManagedObjectContext) -> List {
        let list = NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: inContext) as! List
        list.listName = name
        return list
    }
    
    func taskWithName(name:String, inContext:NSManagedObjectContext) -> Task {
        let task = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: inContext) as! Task
        task.taskName = name
        return task
    }
    
}