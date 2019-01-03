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

