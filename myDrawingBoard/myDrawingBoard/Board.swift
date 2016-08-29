//
//  Board.swift
//  myDrawingBoard
//
//  Created by mayee on 16/8/15.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

/**  touch的状态  */
enum DrawingState {
    case Began, Moved, Ended
}

class Board: UIImageView {

    private var drawingState: DrawingState!

    var brush: BaseBrush!           //画笔
    private var realImage: UIImage? //保存当前图
    var strokeWidth: CGFloat        //画笔宽度
    var strokeColor: UIColor        //画笔颜色
    
    var mutablePath: CGMutablePath
    var context = CGContext?()
    
    
    
    var drawingStateChangedBlock: ((state: DrawingState) -> ())?
    
    override init(image: UIImage?) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        self.mutablePath = CGPathCreateMutable()
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        self.mutablePath = CGPathCreateMutable()
        super.init(coder: aDecoder)
    }
    
    
    // MARK: 手势起点
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.lastPoint = nil
            brush.beginPoint = touches.first?.locationInView(self)
            brush.endPoint = brush.beginPoint
            self.drawingState = .Began
            self.drawingImage()
        }
    }
    
    // MARK: 手势移动
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first?.locationInView(self)
            self.drawingState = .Moved
            self.drawingImage()
        }
    }
    
    // MARK: 手势取消
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    
    // MARK: 手势结束
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first?.locationInView(self)
            self.drawingState = .Ended
            self.drawingImage()
        }
    }
    
    // MARK: 显示当前绘画
    private func drawingImage() {
        if let brush = self.brush {
            
            if let drawingStateChangedBlock = self.drawingStateChangedBlock {
                drawingStateChangedBlock(state: self.drawingState)
            }
            
            //开启一个新的ImageContext，为保存每次的绘图状态作准备
            UIGraphicsBeginImageContext(self.bounds.size)
            
            //初始化context，进行基本设置（画笔）
            //let context = UIGraphicsGetCurrentContext()
            context = UIGraphicsGetCurrentContext()
            
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            CGContextSetLineCap(context, .Round)
            CGContextSetLineWidth(context, self.strokeWidth)
            CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)
            
            //把之前的图片绘制进context中
            if let realImage = self.realImage {
                realImage.drawInRect(self.bounds)
            }
            
            //设置brush的基本属性，以便子类更方便的绘图；调用具体的绘图方法，并最终添加到context中
            brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context!)
            CGContextStrokePath(context)
            
            //从当前的context中，得到Image，如果是ended状态或者需要支持连续不断的绘图，则将Image保存到realImage中
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if (self.drawingState == DrawingState.Ended) || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            
            UIGraphicsEndImageContext()
            
            //实时显示当前的绘制状态，并记录绘制的最后一个点
            self.image = previewImage
            brush.lastPoint = brush.endPoint
            
        }
    }
    
    
    func takeImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.backgroundColor?.setFill()
        UIRectFill(self.bounds)
        self.image?.drawInRect(self.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
   
    //清除绘图
    func clearImage() {
        
        UIGraphicsPushContext(context!)
        let previewImage = UIGraphicsGetImageFromCurrentImageContext()
        if (self.drawingState == DrawingState.Ended) || brush.supportedContinuousDrawing() {
            self.realImage = previewImage
        }
        
        UIGraphicsEndImageContext()
        self.image = previewImage
        //在清理UIGraphics的缓存上很头痛
    }
    func setBrushWidth(brushWidth:CGFloat){
        self.strokeWidth = brushWidth
        
    }
}
