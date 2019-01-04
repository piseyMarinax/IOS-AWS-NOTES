//
//  ViewController.swift
//  Notes
//
//  Created by mp001 on 1/2/19.
//  Copyright © 2019 mp001. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI

// web client
// 483604363162-7ahkfasejqsrp3ut3quhttd58h2ou5nh.apps.googleusercontent.com
// web secret
// G9lnM8QsUgiZGJUk573_YYLh
// IOS
// 483604363162-mpnrdioc7odauu8bretcuqptbq3sd4li.apps.googleusercontent.com

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func doBtnLogout(_ sender: Any) {
        AWSSignInManager.sharedInstance().logout{(value, error) in
            self.CheckForLogin()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CheckForLogin()
    }
    func CheckForLogin(){
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!, configuration: nil){ (provider,error) in
                if error == nil{
                    print("Success")
                }
                else{
                    print(error?.localizedDescription ?? "no value")
                }
            }
        }
    }
}

