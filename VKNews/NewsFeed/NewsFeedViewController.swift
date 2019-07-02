//
//  NewsFeedViewController.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright (c) 2019 admin. All rights reserved.
//

import UIKit

protocol NewsFeedDisplayLogic: class {
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData)
}

class NewsFeedViewController: UIViewController, NewsFeedDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: NewsFeedBusinessLogic?
  var router: (NSObjectProtocol & NewsFeedRoutingLogic)?
    var feedViewModel = FeedViewModel.init(cells: [])

  // MARK: Object lifecycle

  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsFeedInteractor()
    let presenter             = NewsFeedPresenter()
    let router                = NewsFeedRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
    
    tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: NewsFeedCell.cellID)
    interactor?.makeRequest(request: NewsFeed.Model.Request.RequestType.getNewsFeed)
  }
  
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData) {
    switch viewModel {

    case .displayNewsFeed(let feedViewModel):
        self.feedViewModel = feedViewModel
        tableView.reloadData()

    }

  }
  
}
extension  NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.cellID, for: indexPath) as! NewsFeedCell
        let cellViewModel = feedViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
}
