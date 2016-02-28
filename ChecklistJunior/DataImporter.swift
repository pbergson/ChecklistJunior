//
//  DataImporter.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/14/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

struct DataImporter {
    
    let managedObjectContext : NSManagedObjectContext
    
    init(managedObjectContext:NSManagedObjectContext){
        self.managedObjectContext = managedObjectContext
    }
    
    func importDataFromPlist(filepath:String) {
        let data = NSDictionary(contentsOfFile: filepath)
        let allKeysArray = data?.allKeys
        guard let firstListKey = allKeysArray?.first as? String else {
            print("error importing plist")
            return
        }
        
        let listArray = data?.valueForKey(firstListKey) as? [[String:AnyObject]]
        if let realArray = listArray {
            let _ = realArray.map({ (taskDictionary) -> Task in
                self.taskFromDictionary(taskDictionary)
            })
            
            do {
               try self.managedObjectContext.save()
            } catch {
                print("error saving managedObjectContext")
            }
        } 
    }
    
    func taskFromDictionary(info:[String:AnyObject]) -> Task {
        guard let newTask = NSEntityDescription.insertNewObjectForEntityForName(EntityNames.Task.rawValue, inManagedObjectContext: self.managedObjectContext) as? Task else {
            print("error inserting Task object")
            return Task()
        }
        
        if let index = info[PlistKeys.listIndex.rawValue] as? Int {
            newTask.listIndex = NSNumber(integer: index)
        }
        
        if let name = info[PlistKeys.taskName.rawValue] as? String {
            newTask.taskName = name
        }
        
        if let image = info[PlistKeys.imageName.rawValue] as? String {
            newTask.imageName = image
        }
        
        return newTask
    }

}