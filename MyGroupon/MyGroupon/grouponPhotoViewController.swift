//
//  grouponPhotoViewController.swift
//  MyGroupon
//
//  Created by mayee on 16/7/3.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class grouponPhotoViewController: UIViewController {

    @IBOutlet weak var grouponPhotoView: UIImageView!
    
    private var photo:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        grouponPhotoView.image = UIImage.init(imageLiteral: photo!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func  setPhoto(str:String) {
        self.photo = str
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
