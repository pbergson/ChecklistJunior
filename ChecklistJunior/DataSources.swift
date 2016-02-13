//
//  DataSources.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 3/31/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListDataSource : NSObject, UITableViewDataSource {
    
    let coreDataHelper = CoreDataHelper.sharedCoreDataHelper()
    var fetchedResultsController : NSFetchedResultsController
    
    override init() {
        self.fetchedResultsController = self.coreDataHelper.fetchedResultsControllerForLists()
        do {
            try self.fetchedResultsController.performFetch()
        } catch _ {
        }
        super.init()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellToReturn : UITableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier(ReuseIdentifiers.ChecklistMainCell)
        if let realCell = cell {
            cellToReturn = realCell
        } else {
            print("couldn't dequeue main cell")
            cellToReturn = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ReuseIdentifiers.ChecklistMainCell)
        }
        
        let list = self.fetchedResultsController.objectAtIndexPath(indexPath) as! List
        cellToReturn.textLabel?.text = list.listName
        return cellToReturn
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = self.fetchedResultsController.fetchedObjects?.count {
            return numberOfRows
        } else {
            return 0
        }
    }
}

class ListCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let coreDataHelper = CoreDataHelper.sharedCoreDataHelper()
    var fetchedResultsController : NSFetchedResultsController
    
    override init() {
        self.fetchedResultsController = coreDataHelper.fetchedResultsControllerForTasks()
        do {
            try self.fetchedResultsController.performFetch()
        } catch _ {
        }
        //TODO error handling
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numberOfItems = self.fetchedResultsController.fetchedObjects?.count {
            return numberOfItems
        } else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ReuseIdentifiers.CollectionCell, forIndexPath: indexPath) 
        return cell
    }
}

