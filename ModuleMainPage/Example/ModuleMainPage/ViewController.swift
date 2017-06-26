//
//  ViewController.swift
//  ModuleMainPage
//
//  Created by gakaki on 06/17/2017.
//  Copyright (c) 2017 gakaki. All rights reserved.
//

import UIKit
import ModuleMainPage
import CommonLib
import UMMobClick

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ModuleMainPage.test()
        ModuleMainPage.test2()
        ModuleMainPage.test3()
        
        CommonLib.test()
        CommonLib.test2()
        CommonLib.um_config()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

