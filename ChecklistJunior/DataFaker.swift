//
//  DataFaker.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/6/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

class DataFaker {
    func fakeListItem(){
        let coreDataHelper = CoreDataHelper.sharedCoreDataHelper()
        let testList = NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: coreDataHelper.managedObjectContext) as! List
        
        testList.listName = "foo"
        
        self.fakeTaskForList(testList, name:"bar")
        self.fakeTaskForList(testList, name: "baz")
        do {
            try coreDataHelper.managedObjectContext.save()
        } catch _ {
        };
        
    }
    
    func fakeTaskForList(list: List, name: String) {
        let coreDataHelper = CoreDataHelper.sharedCoreDataHelper()
        let fakeTask = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: coreDataHelper.managedObjectContext) as! Task
        fakeTask.taskName = name
        fakeTask.inList = list
    }
}