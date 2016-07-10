//
//  CircleView.swift
//  GraohicsAPI
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class CircleView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextMoveToPoint(context, 80, 150)
    //    CGContextAddLineToPoint(context, 250, 200)
        CGContextAddArc(context, 80, 150, 50, 0, CGFloat(M_PI), 0)
        CGContextFillPath(context)
        //直接设置圆形的方式
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillEllipseInRect(context, CGRect(x:10, y:200, width: 100, height: 100))
        
        CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
        CGContextFillEllipseInRect(context, CGRect(x: 10, y: 400, width: 50, height: 100))
    }
 

}
