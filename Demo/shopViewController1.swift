//
//  shopViewController1.swift
//  Demo
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Fjnu. All rights reserved.
//

import UIKit

class shopViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popToViewController(self, animated: true)
    }
    @IBAction func loginButton(sender: AnyObject) {
        var loginView=UIStoryboard(name: "My", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewControllera")
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId="goodCell"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as! shopCartTableViewCell
        cell.goodName=Model.defaultModel.shopCart[indexPath.row].itemName!
        cell.goodImage=Model.defaultModel.shopCart[indexPath.row].url!
        cell.goodPrice=Model.defaultModel.shopCart[indexPath.row].itemSalePrice!
        cell.thisGoodNumber=Model.defaultModel.shopCart[indexPath.row].num
        cell.select=Model.defaultModel.shopCart[indexPath.row].selected
        return cell
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
