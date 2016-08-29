//
//  PencilBrush.swift
//  HDPencil
//
//  Created by apple on 16/1/6.
//  Copyright © 2016年 hoondraw. All rights reserved.
//

import UIKit


class PencilBrush: BaseBrush {
    
    override func drawInContext(context: CGContextRef) {
        if let lastPoint = self.lastPoint {
            CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        } else {
            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        }
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }

}
