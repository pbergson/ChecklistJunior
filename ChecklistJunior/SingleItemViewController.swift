//
//  SingleItemViewController.swift
//  ChecklistJunior
//
//  Created by Pamela Bergson on 2/12/16.
//  Copyright © 2016 com.mcmxcix. All rights reserved.
//

import UIKit

class SingleItemViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.taskLabel!.text = "Put on your shoes"
        self.imageView!.image = UIImage(named: "Shoes")
    }


}
