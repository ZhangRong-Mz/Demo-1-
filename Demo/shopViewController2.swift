//
//  shopViewController2.swift
//  Demo
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 Fjnu. All rights reserved.
//

import UIKit

class shopViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId="goodCell2"
        var cell:shopCartTableViewCell?=tableView.dequeueReusableCellWithIdentifier(cellId) as! shopCartTableViewCell
        cell?.goodName=Model.defaultModel.shopCart[indexPath.row].itemName!
        cell?.goodImage=Model.defaultModel.shopCart[indexPath.row].url!
        cell?.goodPrice=Model.defaultModel.shopCart[indexPath.row].itemSalePrice!
        cell?.thisGoodNumber=Model.defaultModel.shopCart[indexPath.row].num
        cell?.select=Model.defaultModel.shopCart[indexPath.row].selected
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var goodNumber:Int=0
        for model in Model.defaultModel.shopCart{
            if model.alreadyAddShoppingCart==true {
                goodNumber++
            }
        }
        return goodNumber
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
