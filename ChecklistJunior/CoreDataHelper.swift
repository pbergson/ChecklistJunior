//
//  CoreDataHelper.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/1/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation

private let mySharedCoreDataHelper = CoreDataHelper()

public class CoreDataHelper {
    
    
    
    
    public class func sharedCoreDataHelper() -> CoreDataHelper {
        return mySharedCoreDataHelper
    }
}