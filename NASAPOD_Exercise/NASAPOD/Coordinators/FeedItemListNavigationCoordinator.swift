//
//  FeedItemListDisplayCoordinator.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import UIKit

protocol NavigationCoordinator {
    func getInitialViewController() -> UINavigationController;
}

class FeedItemListNavigationCoordinator : NavigationCoordinator {
        
    func getInitialViewController() -> UINavigationController {
        let navigationController = UINavigationController()
        let urlSession = URLSession(configuration: .default)
        let feedItemDataLoader : FeedItemsDataLoader
        let isRunningUITests = ProcessInfo.processInfo.arguments.contains("UITests")
        if isRunningUITests {
            feedItemDataLoader = LocalFeedItemsLoader(networkClient: URLSessionNetworkClient(urlSession:urlSession) ,jsonDecoder: JSONDecoder())
        } else {
            feedItemDataLoader = RemoteFeedItemsLoader(networkClient: URLSessionNetworkClient(urlSession:urlSession) ,jsonDecoder: JSONDecoder())
        }

        let listViewController = FeedListViewController(dataLoader: feedItemDataLoader) { [weak self] feedItem in
            guard let self = self else {return}
            let detailsViewController = self.getDetailsViewController(feedItem: feedItem)
            navigationController.pushViewController(detailsViewController, animated: true)
        }
        listViewController.title = "Feed Items"
        navigationController.viewControllers = [listViewController];
        navigationController.navigationBar.isTranslucent = false
        return navigationController;
    }
    
    private func getDetailsViewController(feedItem:FeedItem) -> FeedDetailsViewController {
        let detailsViewController = FeedDetailsViewController(feedItem: feedItem)
        return detailsViewController
    }

    deinit {
        print("deinit")
    }

}



