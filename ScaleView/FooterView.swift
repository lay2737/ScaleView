//
//  FooterView.swift
//  ScaleView
//
//  Created by ryhx on 16/3/11.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class FooterView: UICollectionReusableView {
    let radius:CGFloat = 5.0
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        let currenDay = NSDate()
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "M.dd"
        self.dateLabel.text = dateForm.stringFromDate(currenDay)
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextSetRGBStrokeColor(context, 255/255, 252/255, 225/255, 1)
        CGContextSetLineWidth(context, radius/3)
        CGContextAddLines(context, [CGPoint(x:0, y:self.frame.size.height/2),CGPoint(x:self.frame.size.width/3 - radius, y:self.frame.size.height/2)], 2)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        
        //画实心圆
        // CGContextSetRGBStrokeColor(context, 0, 0, 255, 1);
        CGContextSetLineWidth(context, 5.0);
        CGContextAddEllipseInRect(context, CGRectMake(self.frame.size.width/3 - radius, self.frame.size.height/2 - radius,2*radius, 2*radius));//在这个框中画圆'
        CGContextSetFillColor(context, CGColorGetComponents( LExtension.RGBColor(0xFFFCE2) .CGColor) )
        CGContextFillPath(context)
        
    }
}
