//
//  grouponModel.swift
//  Groupon
//
//  Created by mayee on 16/7/3.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class grouponModel: NSObject {
    var grouponName:String?
    var photo:String?
    var price:NSNumber? = 0
    var total:NSNumber? = 0
   
    init (dict:[String:AnyObject]) {
        super.init()
            setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("UndefinedKey \(key) \(value)")
    }
 }
    
  