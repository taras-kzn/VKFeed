//
//  NewsFeedPresenter.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright (c) 2019 admin. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
    switch response {

    case .some:
        print("some present")
    case .presentNewsFeed:
        print("presentNewsFeed present")
        viewController?.displayData(viewModel: .displayNewsFeed)

    }
  
  }
  
}
