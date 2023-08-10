//
//  FeedRepositoryTests.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import XCTest
@testable import BlogFeed

final class FeedRepositoryTests: XCTestCase {
    
    var fakeNetworkManager: FakeNetworkManager!
    var feedRepository: FeedRepositoryContract!
    
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        feedRepository = FeedRepository (networkManager: fakeNetworkManager)
    }
    override func tearDownWithError() throws {
        feedRepository = nil
    }
    
    // when passes feed list array will return with some data
    func test_when_get_Feed_list_success() async {
        let lists = try! await feedRepository.getList(for: URL(string:"FeedResponse")!)
        XCTAssertNotNil(lists)
        
        XCTAssertEqual(lists.count, 10)
        XCTAssertEqual(lists[0].user.name, "NEOM")
    }
    
    // when fails, feed list will be nil
    func test_when_get_Feed_list_fails() async throws{
        let lists = try? await feedRepository.getList(for: URL(string:"FeedFailedResponse")!)
        XCTAssertNil(lists)
        
    }
    
}
