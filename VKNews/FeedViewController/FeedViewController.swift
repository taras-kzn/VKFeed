//
//  FeedViewController.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    let netWorkService: NetWorking = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let param = ["filters": "post, photo"]
        netWorkService.request(path: API.newsFeed, param: param) { (data, error ) in
            if let error = error {
                print("Error recevid requesting data: \(error.localizedDescription)")
            }
            
            guard let data = data else {return}
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print("json: \(json)")
        }

        view.backgroundColor = #colorLiteral(red: 0.2796416879, green: 0.611970067, blue: 0.8864079118, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
