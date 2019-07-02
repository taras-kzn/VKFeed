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
    var dateFormator: DateFormatter = {
        let dF = DateFormatter()
        dF.locale = Locale(identifier: "ru_RU")
        dF.dateFormat = "d MMM 'в' HH:mm"
        return dF
    }()
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
    switch response {

    case .presentNewsFeed(let feed):
        let cells = feed.items.map { (feedItems)  in
            cellFeedViewModel(from: feedItems, profile: feed.profiles, groups: feed.groups)
        }
        let feedviewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedviewModel))
    }
  
  }
    private func cellFeedViewModel(from feedItem: Feeditems, profile: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitel = self.dateFormator.string(from: date)
        let profile = self.profile(for: feedItem.sourceId, profile: profile, groups: groups)
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                       name: profile.name,
                                       date: dateTitel ,
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.repost?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
    private func profile(for sourceId: Int, profile: [Profile], groups: [Group]) -> ProfileRepresentable {
        let profilesGroups: [ProfileRepresentable] = sourceId >= 0 ? profile : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        let profileRepresenTable = profilesGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourceId
        }
        return profileRepresenTable!
    }
  
}
