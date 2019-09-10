//
//  ViewController.swift
//  AutoLayout_Stevia
//
//  Created by Lakshmi on 09/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import Stevia

class LoginViewController: UIViewController {
    
    var loginLbl = UILabel()
    var userNameField = UITextField()
    var pwdField = UITextField()
    var loginBtn = UIButton()
    
    var midScreenHeight = UIScreen.main.bounds.height / 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.isHidden = true
        
        view.sv(
            loginLbl.style({v in
            v.text = "Welcome"
            v.textColor = UIColor.blue
            v.width(100)
            v.textAlignment = .center
            }),
            userNameField.style({v in
                v.placeholder = "enter username"
                v.borderStyle = .roundedRect
                
            }),
            pwdField.style({v in
                v.placeholder = "enter password"
                v.borderStyle = .roundedRect
            }),
            loginBtn.style({ (v) in
                v.width(100)
                v.setTitle("Login", for: .normal)
                v.backgroundColor = UIColor.blue
                v.setTitleColor(UIColor.white, for: .normal)
                v.layer.cornerRadius = 5
                
            })
        )
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        view.layout(
            midScreenHeight,
            |-loginLbl.centerHorizontally().centerVertically()-| ~ 50,
            20,
            |-30-userNameField-30-| ~ 50,
            20,
            |-30-pwdField-30-| ~ 50,
            30,
            |-loginBtn.centerHorizontally()-| ~ 45
        )
    }
    
    @objc func loginAction(){
        print("Good Morning")
        
        let homeObj = HomePageController()
        self.navigationController?.pushViewController(homeObj, animated: true)
//        self.navigationController?.present(homeObj, animated: true, completion: nil)
//        self.navigationController?.viewControllers.append(homeObj)
    }


}

