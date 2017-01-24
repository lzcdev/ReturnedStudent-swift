//
//  LoginViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 17/1/24.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func login(_ sender: AnyObject) {
        self.present(MainTabBarViewController(), animated: true, completion: nil)
    }
    @IBAction func loginQuestion(_ sender: AnyObject) {
    }
    @IBAction func forgetPassword(_ sender: AnyObject) {
    }
    @IBAction func register(_ sender: AnyObject) {
        self.present(RegisterViewController(), animated: true, completion: nil)
    }
    
    @IBAction func tourist(_ sender: AnyObject) {
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
