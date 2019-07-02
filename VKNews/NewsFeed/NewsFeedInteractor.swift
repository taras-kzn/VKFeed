//
//  NewsFeedInteractor.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright (c) 2019 admin. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
    private var fetcher:DataFtcher = NetworkDataFeetcher.init(netWorking: NetworkService())
  
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    
    switch request {

    case .getNewsFeed:
        fetcher.getFeed { [weak self] (feedresponse) in
            guard let feedResponse = feedresponse else {return}
            self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feedResponse))
            
        }

    }
  }
  
}
