//
//  shopCartViewController2Empty.swift
//  Demo
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 Fjnu. All rights reserved.
//

import UIKit

class shopCartViewController2Empty: UIViewController {

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popToViewController(self, animated: true)
    }
    @IBAction func loginView(sender: AnyObject) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
