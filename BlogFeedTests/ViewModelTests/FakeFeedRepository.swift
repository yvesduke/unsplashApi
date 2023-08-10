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
        if url.absoluteString == "success" {
            return Feed.getMockFeed()
        }else if url.absoluteString == "success_empty" {
            return []
        }else {
            throw NetworkError.invalidURL
        }
    }
}
