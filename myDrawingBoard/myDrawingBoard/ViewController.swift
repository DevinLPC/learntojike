//
//  ViewController.swift
//  myDrawingBoard
//
//  Created by mayee on 16/7/10.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brushes = [PencilBrush()]
    @IBOutlet weak var board: Board!
    
    @IBOutlet weak var widthSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.board.brush = brushes[0]
        
        UIView.commitAnimations()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveToAlbum(sender: UIBarButtonItem) {
        UIImageWriteToSavedPhotosAlbum(self.board.takeImage(), self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)

    }
    
    @IBAction func cleanToAlbum(sender: UIBarButtonItem) {
            self.board.clearImage()
    
    }
    
    @IBAction func setWidthToAlbum(sender: UISlider) {

        self.board.setBrushWidth(CGFloat(widthSlider.value))
    }
    

    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Float>) {
        if let err = error {
            let alert = UIAlertController(title: "错误", message: err.localizedDescription, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

}

