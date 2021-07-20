//
//  FeedDetailsViewController.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    
    private let feedItem : FeedItem?

    init(feedItem:FeedItem) {
        self.feedItem = feedItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        feedItem = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item Details"
        self.edgesForExtendedLayout = []
        setupUI();
    }
        
    private func setupUI() {
        let feedItemDetailView = FeedItemDetailView()
        view.backgroundColor = .white
        view.addSubview(feedItemDetailView)
        
        NSLayoutConstraint.activate([
            feedItemDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            feedItemDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedItemDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedItemDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if let feedItem = feedItem {
            feedItemDetailView.imageView.loadImageUsingCache(withUrl: feedItem.url)
            feedItemDetailView.podTitle.text = feedItem.title
            feedItemDetailView.podExplanation.text = feedItem.explanation
            if let copyright = feedItem.copyright {
                feedItemDetailView.copyright.text = "Copyright: \(copyright)"
            } else {
                feedItemDetailView.copyright.text = ""
            }
        }
    }
}


