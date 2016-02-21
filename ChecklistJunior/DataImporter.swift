//
//  DataImporter.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/14/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//

import Foundation

struct DataImporter {
    func arrayFromPlist(filepath:String) -> [NSDictionary]? {
        print(filepath)
        let data = NSDictionary(contentsOfFile: filepath)
        let allKeysArray = data?.allKeys
        guard let firstListKey = allKeysArray?.first as? String else {
            print("error importing plist")
            return nil
        }
        if let firstList = data?.valueForKey(firstListKey) {
            //for now, just make tasks, don't worry about the list.
            print(firstList)
            return firstList as? [NSDictionary]
        } else {
            return nil
        }
    }
    
    //func taskFrom
}