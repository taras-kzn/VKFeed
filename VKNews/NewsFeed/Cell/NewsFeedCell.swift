//
//  NewsFeedCell.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String {get}
    var name: String {get}
    var date: String {get}
    var text: String? {get}
    var likes: String? {get}
    var comments: String? {get}
    var shares: String? {get}
    var views: String? {get}
    
}

class NewsFeedCell: UITableViewCell {
    
    static let cellID = "NewsFeedCell"
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    @IBOutlet weak var postLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: FeedCellViewModel){
        iconImageView.set(imageUrl: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        viewsLabel.text = viewModel.views
        sharesLabel.text = viewModel.shares
        commentsLabel.text = viewModel.comments
        likesLabel.text = viewModel.likes
        postLabel.text = viewModel.text
    }
}
