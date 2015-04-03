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
    
        self.managedObjectContext.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.storeURL(), options: nil, error:nil)
        //TODO how to do errors here?
    }
    
    func fetchEntities(name:String) -> [AnyObject]? {
        let fetchRequest = NSFetchRequest(entityName:name)
        let fetchedResults = self.managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
        return fetchedResults
    }
    
    func fetchedResultsControllerForLists()-> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName:"List")
        let sortDescriptor = NSSortDescriptor(key: "listName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }
    
    public class func sharedCoreDataHelper() -> CoreDataHelper {
        return mySharedCoreDataHelper
    }
}

extension CoreDataHelper {
    func storeURL () -> NSURL? {
        let documentsDirectoryURL = NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true, error:nil)
        
        return documentsDirectoryURL?.URLByAppendingPathComponent("db.sqlite")
    }
}