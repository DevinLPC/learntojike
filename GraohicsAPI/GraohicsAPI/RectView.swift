//
//  RectView.swift
//  GraohicsAPI
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class RectView: UIView {

    

    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 5)
        CGContextSetStrokeColorWithColor(context,UIColor.blueColor().CGColor)
        
        CGContextFillRect(context, CGRect(x: 10, y: 100, width: 100, height: 100))
        
        CGContextStrokeRect(context, CGRect(x: 10, y: 100, width: 100, height: 100))
        
        CGContextSetLineWidth(context, 5)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        CGContextSetLineJoin(context, CGLineJoin.Round) //连接点的样式
        CGContextSetLineCap(context, CGLineCap.Round)   //起始点和终点的样式
        CGContextMoveToPoint(context, 150, 100)
        CGContextAddLineToPoint(context, 150, 200)
        CGContextAddLineToPoint(context, 250, 200)
        CGContextAddLineToPoint(context, 250, 100)
        CGContextAddLineToPoint(context, 150, 100)
        //CGContextStrokePath(context)
        CGContextFillPath(context)
    }
 

}
