//
//  NewsFeedModels.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright (c) 2019 admin. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
        
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsFeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsFeed(feedViewModel: FeedViewModel)
      }
    }
  }
  
}
struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var iconUrlString: String        
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        
    }
    let cells: [Cell]
}
