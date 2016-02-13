//
//  FetchedResultsControllerMaker.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/8/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

struct FetchedResultsControllerMaker {
    let managedObjectContext : NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext){
        self.managedObjectContext = managedObjectContext
    }
    
    func fetchedResultsControllerForLists()-> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName:"List")
        let sortDescriptor = NSSortDescriptor(key: "listName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }
    
    func fetchedResultsControllerForTasks()->NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "taskName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor];
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: "inList", cacheName: nil)
        return controller
    }
}