//
//  ListCollectionViewController.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 4/4/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import UIKit

class ListCollectionViewController : UICollectionViewController {
 
    let dataSource = ListCollectionViewDataSource()
    
    override func viewDidLoad() {
        self.collectionView?.dataSource = dataSource
    }
}
