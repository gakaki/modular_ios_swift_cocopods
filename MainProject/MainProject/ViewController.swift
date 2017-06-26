//
//  ViewController.swift
//  MainProject
//
//  Created by g on 2017/6/17.
//  Copyright © 2017年 g. All rights reserved.
//

import UIKit
import CommonLib
import ModuleMainPage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonLib.test()
        CommonLib.test2()
        CommonLib.test3()
        
        ModuleMainPage.test()
        ModuleMainPage.test3()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

