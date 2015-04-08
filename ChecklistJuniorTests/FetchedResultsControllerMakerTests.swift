//
//  FetchedResultsControllerMakerTests.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/8/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import UIKit
import XCTest
import CoreData

class FetchedResultsControllerMakerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testListFetchedResultsControllerReturnsLists() {
        
        let entityHelper = EntityHelperForTests()
        let managedObjectContext = EntityHelperForTests.makeManagedObjectContext()
        let list = entityHelper.listWithName("foo", inContext: managedObjectContext)
        let listTwo = entityHelper.listWithName("bar", inContext: managedObjectContext)
        
        let maker = FetchedResultsControllerMaker(managedObjectContext: managedObjectContext)
        let controller = maker.fetchedResultsControllerForLists()
        controller.performFetch(nil)
        XCTAssert(controller.fetchedObjects!.count == 2)
    }

}
