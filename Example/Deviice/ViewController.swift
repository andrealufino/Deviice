//
//  ViewController.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 03/20/2016.
//  Copyright (c) 2016 Andrea Mario Lufino. All rights reserved.
//

import UIKit
import Deviice

class ViewController: UIViewController {
    
    @IBOutlet weak var lblIdentifier: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblHumanRedableName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblIdentifier.text = Device.rawIdentifier
        lblType.text = "\(Device.family.rawValue)"
        lblHumanRedableName.text = Device.model.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

