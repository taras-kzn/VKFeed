//
//   UIViewController+Storydoard.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func loadFprmStoryboard<T: UIViewController>()-> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil )
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        }else {
            fatalError("error init viewController in \(name) storyboard")
        }
        
    }
}
