//
//  shopCartTableViewCell.swift
//  Demo
//
//  Created by mac on 15/12/28.
//  Copyright © 2015年 Fjnu. All rights reserved.
//

import UIKit

class shopCartTableViewCell: UITableViewCell{


    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopPrice: UILabel!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shopNumber: UILabel!
    var goodImage:String=""
    var goodName:String="!"
    var goodPrice:String="1"          //商品单价
    var select:Bool=true         //是否被选中,默认刚点进购物车里时，全选
    var thisGoodNumber:Int=1     //商品数量
    
    //减号
    @IBAction func reduceButton(sender: AnyObject) {
        thisGoodNumber--
        UIshopNumber()
        UIshopPrice()
    }
    //加号
    @IBAction func addButton(sender: AnyObject) {
        thisGoodNumber++
        UIshopNumber()
        UIshopPrice()
    }
    //选中按钮，默认全选
    @IBAction func selectButton(sender: AnyObject) {
        if select==false
        {
            print("y")
            selectButton.setImage(UIImage(named: "check_y"), forState: .Normal)
            select=true
        }
        else{
            print("n")
          selectButton.setImage(UIImage(named: "check_n"), forState: .Normal)
            select=false
        }
    }
    
    //设置初始商品为全选,刚进入购物车的时候初始设置全选
    func setAllItem(select:Bool)
    {
        for model in Model.defaultModel.shopCart{
        
            model.selected=true
            model.canChange=true
            
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func UIshopNumber(){
        //显示商品数量
        shopNumber.text=NSString(string: "\(thisGoodNumber)") as String
    }
    func UIshopPrice(){
        //显示商品价格
        shopPrice.text=NSString(string: "\(thisGoodNumber*(Int(goodPrice))!)") as String
    }
    func UIshopName(){
        //显示商品名称
        shopName.text=NSString(string: goodName) as String
    }
    func UIshopImage(){
        //显示商品图片
        shopImage.image=UIImage(named: "\(goodImage)")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
