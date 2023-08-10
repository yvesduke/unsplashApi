//
//  FeddViewModelTests.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import XCTest
@testable import BlogFeed

final class FeedViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    override func tearDownWithError() throws {
    }
    
    // when url is incorrect , it will return immediatly , No data in employee array.
    func test_getFeedList_When_URL_isNotGiven() async{
        
        let fakeFeedRepository = FakeFeedRepository()
        let feedListViewModel = FeedViewModel(repository: fakeFeedRepository)


        await feedListViewModel.getFeedList(url: "")
        let feedList = feedListViewModel.feeds
        XCTAssertEqual(feedList.count, 0)
    }
    
    
    func testGetFeedList_When_APIFailure() async{
        
        let fakeFeedRepository = FakeFeedRepository()
        let feedListViewModel = FeedViewModel(repository: fakeFeedRepository)

        XCTAssertNotNil(feedListViewModel)
        
        await feedListViewModel.getFeedList(url: "FeedFailedResponse")
        

        let feedList = feedListViewModel.feeds
        XCTAssertEqual(feedList.count, 0)

    }
    
}
