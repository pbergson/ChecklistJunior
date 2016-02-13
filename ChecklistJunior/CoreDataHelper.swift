//
//  CoreDataHelper.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/1/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

private let mySharedCoreDataHelper = CoreDataHelper()

public class CoreDataHelper {
    
    let managedObjectContext : NSManagedObjectContext
    
    init(){
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        let modelURL = NSBundle.mainBundle().URLForResource("ChecklistJuniorModel", withExtension: "momd")
        if let validURL = modelURL {
            let model = NSManagedObjectModel(contentsOfURL: validURL)
            self.managedObjectContext.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
            //TODO fix unwrapping
        }
    
        try? self.managedObjectContext.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.storeURL(), options: nil)
        //TODO how to do errors here?
    }
    
    func fetchEntities(name:String) -> [AnyObject]? {
        let fetchRequest = NSFetchRequest(entityName:name)
        let fetchedResults = try? self.managedObjectContext.executeFetchRequest(fetchRequest)
        return fetchedResults
    }
    
    public func fetchedResultsControllerForLists()-> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName:"List")
        let sortDescriptor = NSSortDescriptor(key: "listName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }
    
    public func fetchedResultsControllerForTasks()->NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "taskName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor];
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: "inList", cacheName: nil)
        return controller
    }
    
    public class func sharedCoreDataHelper() -> CoreDataHelper {
        return mySharedCoreDataHelper
    }
}

extension CoreDataHelper {
    func storeURL () -> NSURL? {
        let documentsDirectoryURL = try? NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        return documentsDirectoryURL?.URLByAppendingPathComponent("db.sqlite")
    }
}