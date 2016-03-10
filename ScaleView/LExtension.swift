//
//  LExtension.swift
//  ScaleView
//
//  Created by ryhx on 16/3/10.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class LExtension: NSObject {
    
    static func RGBColor(value:Int) -> UIColor{

    return UIColor(red: CGFloat((value & 0xFF0000) >> 16)/255.0, green: CGFloat((value & 0x00FF00) >> 8)/255.0, blue: CGFloat(value & 0x0000ff)/255.0, alpha: 1)
 
    }
}

