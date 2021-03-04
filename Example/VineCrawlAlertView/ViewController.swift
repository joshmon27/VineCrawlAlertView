//
//  ViewController.swift
//  VineCrawlAlertView
//
//  Created by 15055480 on 03/03/2021.
//  Copyright (c) 2021 15055480. All rights reserved.
//

import UIKit
import JWAlertView
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(alertView)
        alertView.center = view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

