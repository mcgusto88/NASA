//
//  FeedItem.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import Foundation

struct FeedItem : Codable {
    let date: String
    let explanation: String
    let hdurl: String?
    let mediaType: String
    let title: String
    let url: String
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case title
        case url
        case copyright
    }

}
