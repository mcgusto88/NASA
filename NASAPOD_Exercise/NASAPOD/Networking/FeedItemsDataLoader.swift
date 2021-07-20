//
//  FeedItemService.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import Foundation

protocol FeedItemsDataLoader {
    var networkClient : HTTPClient { get }
    var jsonDecoder : JSONDecoder { get }
    func getFeedItems(startDate:String, endDate:String , completion: ((Result<[FeedItem],CustomError>)->Void)?);
}

class RemoteFeedItemsLoader : FeedItemsDataLoader {
    var networkClient: HTTPClient
    var jsonDecoder: JSONDecoder
    init(networkClient:HTTPClient,jsonDecoder:JSONDecoder) {
        self.networkClient = networkClient
        self.jsonDecoder = jsonDecoder
    }
    
    private let feedItemsBaseUrl = "https://api.nasa.gov/planetary/apod?api_key=9a348S2w1BofpXRgrGpqK2qdymeeIj7sAhyCa2tK";
    
    func getFeedItems(startDate:String, endDate:String, completion: ((Result<[FeedItem], CustomError>) -> Void)?) {
        let feedItemsUrl = feedItemsBaseUrl + "&start_date=\(startDate)&end_date=\(endDate)"
        networkClient.get(url: feedItemsUrl, queryParameters: nil) {  [weak self] result in
            guard let self = self else {return}
            switch(result){
            case .success(let data):
                do {
                    let feedItems = try self.jsonDecoder.decode([FeedItem].self, from: data)
                    completion?(.success(feedItems))
                }
                catch (let error) {
                    print(error)
                    completion?(.failure(.decodeError))
                }
                break;
            case.failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    func getFeedItemImage(url:String)  {
        
    }
}

class LocalFeedItemsLoader : FeedItemsDataLoader {
    var networkClient: HTTPClient
    
    var jsonDecoder: JSONDecoder
    
    init(networkClient:HTTPClient,jsonDecoder:JSONDecoder) {
        self.networkClient = networkClient
        self.jsonDecoder = jsonDecoder
    }
    
    func getFeedItems(startDate:String, endDate:String, completion: ((Result<[FeedItem], CustomError>) -> Void)?) {
        if let path = Bundle.main.path(forResource: "MockData", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let feedItems = try self.jsonDecoder.decode([FeedItem].self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    completion?(.success(feedItems))
                }
            }
            catch(let error) {
                print(error)
                completion?(.failure(.decodeError))
            }
        }
    }
    
}



