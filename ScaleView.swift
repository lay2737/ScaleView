//
//  ScaleView.swift
//  ScaleView
//
//  Created by ryhx on 16/3/9.
//  Copyright © 2016年 lay. All rights reserved.
//

import UIKit

class ScaleView: UIView ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    var itemCount:NSInteger? {
        get{
            return self.itemCount!+4
        }
        set{
            self.itemCount = newValue
        }
    }
    let dateArray = ["","","","","","","",""]
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(self.frame.size.width/2, self.frame.size.height/2)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2), collectionViewLayout: flowLayout)
        collection.registerNib(UINib.init(nibName: "ScaleCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        // collectionView.registerClass(UICollectionViewCell().classForCoder, forCellWithReuseIdentifier: "cell")
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        //collection.bounces = false
        collection.contentSize = CGSize(width: self.frame.size.width*11, height: 100)
       print( flowLayout.collectionViewContentSize())
        self.addSubview(collection)
        
        //default
        collection.contentOffset = CGPoint(x:flowLayout.itemSize.width*2, y:0)
        return collection
    }()
    
   
    var signLable:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        signLable = UILabel.init(frame: CGRectMake(self.frame.size.width/2-100, self.frame.size.height/4, 200, self.frame.size.height/4))
        signLable.text = "连续签到 8 天"
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
        
        
        let gradient = CAGradientLayer.init()
        gradient.frame = self.bounds
        gradient.colors = [LExtension.RGBColor(0xFF6778).CGColor,LExtension.RGBColor(0x96A0E8).CGColor]
        self.layer.insertSublayer(gradient, atIndex: 0)
        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ScaleCell
        cell.shouldDrawed = indexPath.row == 9 ? false : true
       // cell.drawLine()
     //   cell.backgroundColor =  indexPath.row%2==0 ? UIColor.blackColor():UIColor.whiteColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
