//
//  BaseBrush.swift
//  myDrawingBoard
//
//  Created by mayee on 16/8/15.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

protocol PaintBrush {
    /**  表示是否连续不断地绘图  */
    func supportedContinuousDrawing() -> Bool;
    /**  基于Context（上下文）的绘图方法，子类必须实现具体的绘图  */
    func drawInContext(context: CGContextRef)
}

class BaseBrush: NSObject, PaintBrush {

    var beginPoint: CGPoint!        //开始点的位置
    var endPoint: CGPoint!          //结束点的位置
    var lastPoint: CGPoint?         //最后一个点的位置（也可以称作是上一个点的位置）
    var strokeWidth: CGFloat!       //
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    func drawInContext(context: CGContextRef) {
        assert(false, "must implements in subclass")
    }
}
