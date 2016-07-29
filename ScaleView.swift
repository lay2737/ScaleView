//
//  ScaleView.swift
//  ScaleView
//
//  Created by ryhx on 16/3/9.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class ScaleView: UIView ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    //传入签到日期数组
    var dateArray = [["2.8","2.10"],["2.17","2.20"],["2.22","2.24"],["3.1","3.8"]]
    
    lazy var collectionView:UICollectionView = {
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(self.frame.size.width/3*2, self.frame.size.height/2)
        flowLayout.footerReferenceSize = CGSize(width:self.frame.size.width/3, height:self.frame.size.height/2)
        flowLayout.headerReferenceSize = CGSize(width:1, height:1)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumLineSpacing = 0
        
        let collection:UICollectionView = UICollectionView(frame: CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2), collectionViewLayout: flowLayout)
        collection.registerNib(UINib.init(nibName: "ScaleCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collection.registerNib(UINib.init(nibName: "FooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footCell")
       
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        
        self.addSubview(collection)
        
        //default
        collection.contentOffset = CGPoint(x:flowLayout.itemSize.width*2, y:0)
        collection.contentSize = CGSize(width: 200, height: 50)
        
        print( flowLayout.collectionViewContentSize())
        return collection
    }()
    
    
    var signLable:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        signLable = UILabel.init(frame: CGRectMake(self.frame.size.width/2-100, self.frame.size.height/4, 200, self.frame.size.height/4))
        signLable.text = "连续签到 1 天"
        signLable.font = UIFont.systemFontOfSize(22)
        signLable.textColor = LExtension.RGBColor(0xFFFCE2)
        signLable.textAlignment = NSTextAlignment.Center
        self.addSubview(signLable)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        collectionView.backgroundColor = UIColor.clearColor()
        
        //渐变色
        let gradient = CAGradientLayer.init()
        gradient.frame = self.bounds
        gradient.colors = [LExtension.RGBColor(0xFF6778).CGColor,LExtension.RGBColor(0x96A0E8).CGColor]
        self.layer.insertSublayer(gradient, atIndex: 0)
   
        let time = dateArray.last?.last
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "MM.dd"
        let date = dateForm.dateFromString(time!)
        
        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let flags: NSCalendarUnit = .Day
        let nowCom = calendar.components(flags, fromDate: now)
        let timeCom = calendar.components(flags, fromDate: date!)
        signLable.text = "连续签到 \(nowCom.day - timeCom.day) 天"

    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ScaleCell
        cell.shouldDrawed = indexPath.row == dateArray.count-1 ? false : true
        cell.startLabel.text = dateArray[indexPath.row][0]
        cell.endLabel.text = dateArray[indexPath.row][1]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var v = FooterView()
        if kind == UICollectionElementKindSectionFooter{
            
            v = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "footCell", forIndexPath: indexPath) as! FooterView
            print("foot")
        }
        return v
        
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSizeZero;
        //return CGSize(width: self.bounds.width/3*2, height: self.bounds.width/2)
    }
  
}
