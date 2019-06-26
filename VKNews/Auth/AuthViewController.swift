//
//  AuthViewController.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authServise: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        authServise = AuthService()
        authServise = AppDelegate.shared().authService


    }
    
    @IBAction func signInTouch() {
        
        authServise.wakeUpSession() 
    }
    


}
