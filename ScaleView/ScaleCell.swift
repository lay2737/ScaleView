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
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var lostLabel: UILabel!
    func drawLine(){
//        if ((UIGraphicsGetCurrentContext()) == nil){
//            return
//        }
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
         CGContextClearRect(context, self.bounds)
        
        //画三角
    
        CGContextAddLines(context, [CGPoint(x:self.frame.size.width/2-5, y:self.frame.size.height/2+15),CGPoint(x:self.frame.size.width/2, y:self.frame.size.height/2+10),CGPoint(x:self.frame.size.width/2+5, y:self.frame.size.height/2+15)], 3)
        CGContextSetFillColor(context, CGColorGetComponents( UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5) .CGColor) )
        CGContextFillPath(context)
        
        
        //画直线
        CGContextSetRGBStrokeColor(context, 255/255, 252/255, 225/255, 1)
        CGContextSetLineWidth(context, radius/3)
        CGContextAddLines(context, [CGPoint(x:0, y:self.frame.size.height/2),CGPoint(x:self.frame.size.width/3 - radius, y:self.frame.size.height/2)], 2)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        
        
        //画实心圆
        CGContextSetLineWidth(context, 5.0);
        CGContextAddEllipseInRect(context, CGRectMake(self.frame.size.width/3 - radius, self.frame.size.height/2 - radius,2*radius, 2*radius));//在这个框中画圆'
        CGContextSetFillColor(context, CGColorGetComponents( LExtension.RGBColor(0xFFFCE2) .CGColor) )
        CGContextFillPath(context)
        
        //画虚线
        let count = (self.frame.size.width/3)/radius
        for index in 1...Int(count){
            CGContextAddRect(context, CGRectMake(self.frame.size.width/3+CGFloat(index-1)*radius, self.frame.size.height/2-radius/4, radius/2, radius/2))
            CGContextSetFillColorWithColor(context, LExtension.RGBColor(0xFFFCE2) .CGColor)
            CGContextFillPath(context)
        }
        
        //画边框圆
        CGContextSetLineWidth(context, 1)
        CGContextAddArc(context, self.frame.size.width/3*2, self.frame.size.height/2, radius-0.5,  0,CGFloat(2)*PI, 0)
        CGContextStrokePath(context);
        
        //画直线
        CGContextSetLineWidth(context, radius/3)
        CGContextAddLines(context, [CGPoint(x:self.frame.size.width/3*2+radius, y:self.frame.size.height/2),CGPoint(x:self.frame.size.width , y:self.frame.size.height/2)], 2)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
    
        
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.drawLine()

    }
}
