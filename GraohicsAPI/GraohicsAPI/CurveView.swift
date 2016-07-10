//
//  CurveView.swift
//  GraohicsAPI
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class CurveView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 10, 200)
        //CGContextAddQuadCurveToPoint(context, 100, 0, 200, 200)
        CGContextAddCurveToPoint(context, 100, 0, 100, 400, 200, 200)
        CGContextStrokePath(context)
    }
 

}
