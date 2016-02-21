//
//  DataImporterTests.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/14/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//

import XCTest

class DataImporterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImportingPlist() {
        let path = NSBundle.mainBundle().pathForResource("InitialData", ofType: "plist")
        let importer = DataImporter()
        let taskArray = importer.arrayFromPlist(path!)
        XCTAssertNotNil(taskArray)
        
        
    }
    
}