//
//  ShapeView.swift
//  GraohicsAPI
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
        CGContextMoveToPoint(context, 10, 100)
        CGContextAddLineToPoint(context, 10, 200)
        CGContextAddLineToPoint(context, 110, 200)
        
    
        CGContextFillPath(context)
    }
 

}
