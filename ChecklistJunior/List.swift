//
//  List.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/1/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import CoreData

class List: NSManagedObject {
    @NSManaged var name : String {
        get {
            return self.name
        }
        set (steps){
            let defaults: NSUserDefaults = NSUserDefaults(suiteName: "group.com.heliumfoot.FitFight")!
            
            defaults.setInteger(steps, forKey: kNumberOfStepsDefaultsKey)
        }
    
    
}