//
//  LinesView.swift
//  GraohicsAPI
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class LinesView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 10) //设置粗细
        //CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor(red: 1, green: 1, blue: 0, alpha: 1).CGColor)
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        
        CGContextAddLineToPoint(context, 200, 200)
        
        CGContextStrokePath(context)
    }
    
 

}
