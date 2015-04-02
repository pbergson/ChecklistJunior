//
//  ViewController.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 3/31/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    
    var listDataSource = ListDataSource()
    var listTableViewDelegate = ListTableViewDelegate()
    
    override func viewDidLoad() {
        makeFakeData()
        self.tableView!.dataSource = listDataSource
        let coreDataHelper = CoreDataHelper()
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func makeFakeData(){
        let coreDataHelper = CoreDataHelper()
        let testList = NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: coreDataHelper.managedObjectContext) as! List
        
        testList.name = "foo"
        
    }
}

