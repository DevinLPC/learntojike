//
//  grouponTableViewController.swift
//  MyGroupon
//
//  Created by mayee on 16/7/3.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class grouponTableViewController: UITableViewController {

    private var grouponArr:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //字典转模型部分
        //取字典数组
        let array = NSArray(contentsOfURL: NSBundle.mainBundle().URLForResource("Groupon", withExtension: "plist")!)
        let analysedArray = NSMutableArray()  //创建模型数组
        for dict in array! {
            let model = grouponModel(dict : dict as! [String : AnyObject])
            analysedArray.addObject(model)
        }
        grouponArr = NSArray(array: analysedArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return grouponArr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

    
        let currentGroupon = grouponArr.objectAtIndex(indexPath.row) as! grouponModel
        
        let grouponNammeLable = cell.viewWithTag(1) as!UILabel
        

        grouponNammeLable.text = currentGroupon.grouponName
        
        let grouponInfLable = cell.viewWithTag(2) as!UILabel

        grouponInfLable.text = "价格:\((currentGroupon.price?.floatValue)!)元\t\t卖出\((currentGroupon.total?.floatValue)!)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let grouponPhoto =
            storyboard?.instantiateViewControllerWithIdentifier("grouponPhoto") as! grouponPhotoViewController
        
        let groupon = grouponArr.objectAtIndex(indexPath.row) as! grouponModel
        
        grouponPhoto.setPhoto(groupon.photo!)
        
        navigationController?.pushViewController(grouponPhoto, animated: true)
    }
    
}
