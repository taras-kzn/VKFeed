//
//  AuthService.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShoulShouw(_ viewController: UIViewController)
    func authServiceSignIn()
    func  authServiceDidSignInFaild()
}


final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {


    private var appId = "7034229"
    private var vkSdk: VKSdk
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    func wakeUpSession() {
        //let scope = ["offline"]
        let scope = ["offline","wall","friends"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState" )
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                
                print("VKAuthorizationState")
                VKSdk.authorize(scope)
            } else {
                print("auth problems , state - \(state) , error \(String(describing: error))")
                delegate?.authServiceDidSignInFaild()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil{
            delegate?.authServiceSignIn()
        }
        
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShoulShouw(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
