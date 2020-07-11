//
//  ViewController.swift
//  YouTube
//
//  Created by sachin sharma on 08/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos() 
        
    }


}

