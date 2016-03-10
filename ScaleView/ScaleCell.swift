//
//  ScaleCell.swift
//  ScaleView
//
//  Created by ryhx on 16/3/9.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class ScaleCell: UICollectionViewCell {
    let PI = CGFloat(M_PI)
    let radius:CGFloat = 5.0
    var shouldDrawed:Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func drawLine(){
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
       // CGContextClearRect(context, self.bounds)
    
        
        //画虚线
        let count = (self.frame.size.width-radius)/2/radius
        for index in 1...Int(count-1){
            CGContextAddRect(context, CGRectMake(CGFloat(index-1)*radius, self.frame.size.height/2-radius/4, radius/2, radius/2))
            CGContextSetFillColorWithColor(context, LExtension.RGBColor(0xFFFCE2) .CGColor)
            CGContextFillPath(context)
            // CGContextDrawPath(context, kCGPathFillStoke)
        }
        
        //画边框圆
        CGContextSetRGBStrokeColor(context, 255/255, 252/255, 225/255, 1)
        CGContextSetLineWidth(context, 1)
        CGContextAddArc(context, self.frame.size.width/2 - radius, self.frame.size.height/2, radius,  0,CGFloat(2)*PI, 0)
        //CGContextSetFillColor(context, CGColorGetComponents( LExtension.RGBColor(0xFFFCE2) .CGColor) )
        //CGContextFillPath(context)
        CGContextStrokePath(context);
        
        //画直线
        CGContextSetLineWidth(context, radius/3)
        CGContextAddLines(context, [CGPointMake(self.frame.size.width/2 , self.frame.size.height/2),CGPointMake(self.frame.size.width - 2*radius, self.frame.size.height/2)], 2)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        
        
        //画实心圆
        // CGContextSetRGBStrokeColor(context, 0, 0, 255, 1);
        CGContextSetLineWidth(context, 5.0);
        CGContextAddEllipseInRect(context, CGRectMake(self.frame.size.width - 2*radius, self.frame.size.height/2 - radius,2*radius, 2*radius));//在这个框中画圆'
        CGContextSetFillColor(context, CGColorGetComponents( LExtension.RGBColor(0xFFFCE2) .CGColor) )
        CGContextFillPath(context)
    
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.drawLine()
        
        
    }
}
