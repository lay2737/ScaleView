//
//  ViewController.swift
//  ScaleView
//
//  Created by ryhx on 16/3/9.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       let scale = ScaleView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, 200))
      //  scale.backgroundColor = UIColor.redColor()
        self.view.addSubview(scale)
    }

   


}

