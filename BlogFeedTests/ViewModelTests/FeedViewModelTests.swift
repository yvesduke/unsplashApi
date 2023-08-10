//
//  FeddViewModelTests.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import XCTest
@testable import BlogFeed

final class FeedViewModelTest: XCTestCase {
    
    let fakeFeedRepository = FakeFeedRepository()
    var feedListViewModel: FeedViewModel!
    override func setUpWithError() throws {
       feedListViewModel = FeedViewModel(repository: fakeFeedRepository)
    }
    override func tearDownWithError() throws {
        feedListViewModel = nil
    }
    
    // when api returns success response with some feeds data
    func test_get_feedlist_when_success_with_feeds_data() async{
        
        await feedListViewModel.getFeedList(url: "success")
        XCTAssertEqual(feedListViewModel.viewState, .load(feeds: Feed.getMockFeed()))
    }
    
    // when api returns success response with empty feed data
    func test_get_feedlist_when_success_with_empty_feeds_data() async{
        
        await feedListViewModel.getFeedList(url: "success_empty")
        XCTAssertEqual(feedListViewModel.viewState, .load(feeds: []))
    }
    
    // when url is incorrect , it will return immediatly , No data in employee array.
    func test_get_feedlist_when_url_is_not_correct() async{
        
        await feedListViewModel.getFeedList(url: "")
        XCTAssertEqual(feedListViewModel.viewState, .error(message:"Invalid URL"))
    }
    
    // when api calls fails.
    func testGetFeedList_When_APIFailure() async{
        
        await feedListViewModel.getFeedList(url: "FeedFailedResponse")

        XCTAssertEqual(feedListViewModel.viewState, .error(message: "Something went wrong, Pls try again"))
    }
}
