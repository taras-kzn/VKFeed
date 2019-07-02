//
//  FeedResponse.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    var response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [Feeditems]
    var profiles: [Profile]
    var groups: [Group]
}
struct Feeditems: Decodable {
    let sourceId: Int
    let postId: Int
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
protocol ProfileRepresentable {
    var id: Int {get}
    var name:String {get}
    var photo: String {get}
}

struct Profile: Decodable,ProfileRepresentable {

    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String {return firstName + " " + lastName}
    var photo: String {return photo100}
}

struct Group : Decodable,ProfileRepresentable {

    let id: Int
    let name: String
    let photo100: String
    
    var photo: String {return photo100}
}
