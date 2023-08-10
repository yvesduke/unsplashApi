//
//  FakeFeedRepository.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import Foundation
@testable import BlogFeed

class FakeFeedRepository: FeedRepositoryContract {
    
    func getList(for url: URL) async throws ->  [BlogFeed.Feed]{
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let lists = try JSONDecoder().decode([Feed].self, from: data )
            return lists
        } catch {
            throw NetworkError.invalidURL
        }
    }
    
    

    
}
