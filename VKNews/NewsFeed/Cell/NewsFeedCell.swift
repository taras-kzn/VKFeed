//
//  NewsFeedCell.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedCell: UITableViewCell {
    
    static let cellID = "NewsFeedCell"
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    @IBOutlet weak var postLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
