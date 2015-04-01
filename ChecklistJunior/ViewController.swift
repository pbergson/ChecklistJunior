//
//  ViewController.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 3/31/15.
//  Copyright (c) 2015 com.mcmxcix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstImageView : UIImageView!
    
    override func viewDidLoad() {
        let image = UIImage(named: "Shoes.jpg")
        firstImageView.image = image
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

