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

@IBDesignable

extension UIView {
    
    
    @IBInspectable var  borderColor: UIColor{
        set{
            self.layer.masksToBounds = true
            self.layer.borderColor = newValue.CGColor
        }
        get{
           return self.borderColor
        }
    }
    @IBInspectable var  borderWidth: CGFloat{
        set{
            self.layer.masksToBounds = true
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var  cornerRadius: CGFloat{
        set{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
}