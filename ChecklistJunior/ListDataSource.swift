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
    var fetchedResultsController : NSFetchedResultsController
    
    override init() {
        self.fetchedResultsController = self.coreDataHelper.fetchedResultsControllerForLists()
        self.fetchedResultsController.performFetch(nil)
        super.init()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier") as! UITableViewCell
        let list = self.fetchedResultsController.objectAtIndexPath(indexPath) as! List
        cell.textLabel?.text = list.listName
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = self.fetchedResultsController.fetchedObjects?.count {
            return numberOfRows
        } else {
            return 0
        }
    }
}

class ListTableViewDelegate {
    
}