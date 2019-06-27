//
//  FeedViewController.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private var fatcher: DataFtcher = NetworkDataFeetcher(netWorking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.backgroundColor = #colorLiteral(red: 0.2796416879, green: 0.611970067, blue: 0.8864079118, alpha: 1)
        fatcher.getFeed { (feedresponse) in
            guard let feedresponse = feedresponse else {return}
            feedresponse.items.map({ (feeditems) in
                print(feeditems.date)
            })
        }
    }
    

}
