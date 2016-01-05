//
//  shopCartViewController2.swift
//  Demo
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 Fjnu. All rights reserved.
//

import UIKit

class shopCartViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var payPrice: CFloat = 0.00
    var price: CFloat = 0.00
    @IBOutlet weak var tableView1: UITableView!
// 导航栏左边返回
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popToViewController(self, animated: true)
    }

    @IBAction func loginButton(sender: AnyObject) {
        var loginView=UIStoryboard(name: "My", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewControllera") as UIViewController
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    /// 商品列表cell的重用标识符
    private let shoppingCarCellIdentifier = "shoppingCarCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 标题
        navigationItem.title = "购物车列表"
        self.tabBarController!.tabBar.hidden = false;
        // view背景颜色
        view.backgroundColor = UIColor.whiteColor()
        
        // cell行高
        
        tableView1.rowHeight = 80
        
        // 注册cell
        tableView1.registerClass(JFShoppingCartCell.self, forCellReuseIdentifier: shoppingCarCellIdentifier)
        
        // 设置TableViewHeader
        self.tableView1.header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
            self.tableView1.reloadData()
            self.reCalculateTotalPrice()
            self.tableView1.header.endRefreshing()
        })
        //配置toolbar
        configureToolbar()
        
        // 添加子控件
        tableView1.addSubview(bottomView)
        bottomView.addSubview(selectButton)
        bottomView.addSubview(totalPriceLabel)
        bottomView.addSubview(buyButton)
        bottomView.addSubview(selectBrunch)
        // 判断是否需要全选
        
        for model in Model.defaultModel.shopCart {
            if model.selected != true && model.canChange == true{
                // 只要有一个不等于就不全选
                selectButton.selected = false
                break
            }
        }

    }
    /// 底部选择店铺按钮
    lazy var selectBrunch: UITextField = {
        let selectBrunch = UITextField()
        selectBrunch.font = UIFont.systemFontOfSize(12)
        return selectBrunch
        }()
    /// 底部付款按钮
    lazy var buyButton: UIButton = {
        let buyButton = UIButton(type: UIButtonType.Custom)
        buyButton.setTitle("付款", forState: UIControlState.Normal)
        buyButton.setBackgroundImage(UIImage(named: "button_cart_add"), forState: UIControlState.Normal)
        buyButton.frame = CGRect(x: 375 - 100, y: 9, width: 88, height: 30)
        buyButton.layer.cornerRadius = 15
        buyButton.layer.masksToBounds = true
        buyButton.addTarget(self, action: "isPaySelect", forControlEvents: UIControlEvents.TouchUpInside)
        return buyButton
        }()

    /// 底部总价Label
    lazy var totalPriceLabel: UILabel = {
        let totalPriceLabel = UILabel()
        let attributeText = NSMutableAttributedString(string: "总价：\(self.price)")
        attributeText.setAttributes([NSForegroundColorAttributeName : UIColor.redColor()], range: NSMakeRange(3, attributeText.length - 3))
        
        totalPriceLabel.attributedText = attributeText
        totalPriceLabel.sizeToFit()
        return totalPriceLabel
        }()

    /// 底部多选、反选按钮
    lazy var selectButton: UIButton = {
        let selectButton = UIButton(type: UIButtonType.Custom)
        selectButton.setImage(UIImage(named: "check_n"), forState: UIControlState.Normal)
        selectButton.setImage(UIImage(named: "check_y"), forState: UIControlState.Selected)
        selectButton.setTitle("多选\\反选", forState: UIControlState.Normal)
        selectButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        selectButton.titleLabel?.font = UIFont.systemFontOfSize(12)
        selectButton.addTarget(self, action: "didTappedSelectButton:", forControlEvents: UIControlEvents.TouchUpInside)
        selectButton.selected = true
        selectButton.sizeToFit()
        return selectButton
        }()

    /// 底部视图
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.whiteColor()
        return bottomView
        }()
    //配置tool bar Item 函数
    func configureToolbar(){
        let toolbarButtonItem = [addButtonItem,
            flexibleSpaceBarButtonItem,
            cameraButtonItem]
        accView.setItems(toolbarButtonItem, animated: true);
        self.selectBrunch.inputView = pickView
        self.selectBrunch.inputAccessoryView = accView
    }
    //tool bar 关闭toolbar按钮 item
    var addButtonItem:UIBarButtonItem{
        
        return UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "backAction:")
    }
    
    //tool bar 确认选择按钮 item
    var cameraButtonItem:UIBarButtonItem{
        
        return UIBarButtonItem(barButtonSystemItem: .Done, target:self, action: "selectAction:")
    }
    
    //tool bar 中间的弹簧
    var flexibleSpaceBarButtonItem: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    }


/// accView
var accView: UIToolbar = {
    let accView = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 38))
    return accView
    }()
/// pickView
var pickView: UIPickerView = {
    let pickView = UIPickerView()
    return pickView
    }()

    /**
    重新计算总价
    */
    func reCalculateTotalPrice() {
        reCalculateGoodCount()
    }



/**
重新计算商品数量
*/
private func reCalculateGoodCount() {
    
    // 遍历模型
    for model in Model.defaultModel.shopCart{
        
        // 只计算选中的商品
        if model.selected == true && model.canChange == true {
            print("\(price) \(model.itemSalePrice)")
            var str = model.itemSalePrice! as NSString
            let isPerfix = str.hasPrefix("￥")
            if !isPerfix {
                str = str.substringFromIndex(2)
            }
            price += Float(model.num) * (str).floatValue
        }
    }
    
    // 赋值价格
    let attributeText = NSMutableAttributedString(string: "总价：\(self.price)")
    attributeText.setAttributes([NSForegroundColorAttributeName : UIColor.redColor()], range: NSMakeRange(3, attributeText.length - 3))
    totalPriceLabel.attributedText = attributeText
    //赋值给payPrice
    
    payPrice = price
    
    // 清空price
    price = 0
    
    // 刷新表格
    tableView1.reloadData()
}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 as Int
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
