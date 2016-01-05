//
//  shopCartViewController1.swift
//  Demo
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 Fjnu. All rights reserved.
//

import UIKit

class shopCartViewController1: UIViewController,UITableViewDataSource,UITableViewDelegate{

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var cellNumber=1
    var sectionNumber=1
    var cellView:UITableViewCell
    var ID:String = ""
    var goodImage:UIImageView
    var totalView1=UIView()
    var allButton=UIButton() //是否全选的button
    var allButtonValue:Bool=true //默认全选
    var checkNoImage=UIImage(named: "check_n")
    var checkYesImage=UIImage(named: "check_y")
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popToViewController(self, animated: true)
        self.tabBarController?.tabBar.hidden=true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 标题
        navigationItem.title = "购物车列表"
        self.tabBarController!.tabBar.hidden = false;
        //tabBarButton
        var barButton=MainTabBarController()
        self.addChildViewController(barButton)
        // view背景颜色
        view.backgroundColor = UIColor.whiteColor()
        // cell行高
        tableView.rowHeight = 80
        
    }
//total视图
    func toatlView(){
        totalView1.frame=CGRectMake(0, MainBounds.height-(tabBarController?.tabBar.height)!, MainBounds.width, 50)
        allButton.addTarget(self, action: "selectAll", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
//allButton响应事件
      func selectAll() {
       allButtonValue = !allButtonValue
        for model in Model.defaultModel.shopCart{
            if model.canChange == true{
            
                model.selected=allButtonValue
            }
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        cellView.addSubview(goodImage)
         return cellView
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
         return sectionNumber
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
