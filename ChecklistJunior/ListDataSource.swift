//
//  DataSource.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 3/31/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListDataSource : NSObject, UITableViewDataSource {
    
    let coreDataHelper = CoreDataHelper()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier") as! UITableViewCell
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fetchedLists = coreDataHelper.fetchEntities("List")
        let numberOfRows: Int
        if let validLists = fetchedLists {
            numberOfRows = validLists.count
        } else {
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    
}

class ListTableViewDelegate {
    
}