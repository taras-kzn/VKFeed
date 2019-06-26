//
//  FeedResponse.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct FeedResponse: Decodable {
    var items: [Feeditems]
}
struct Feeditems: Decodable {
    let sourceID: Int
    let postID: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let repost: CountableItem?
    let views: CountableItem?
    
}
struct CountableItem: Decodable {
    let count: Int
}
