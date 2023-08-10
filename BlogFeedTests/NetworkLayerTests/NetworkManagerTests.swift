//
//  NetworkManagerTests.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import XCTest
@testable import BlogFeed

final class NetworkManagerTests: XCTestCase {

    func test_get_Feed_list_when_api_is_success() async {
        // Reading local json file data
        let bundle = Bundle(for: NetworkManagerTests.self)
        guard let path =  bundle.url(forResource: "FeedResponse", withExtension: "json") else { return }
        let data = try? Data(contentsOf: path)
        NetworkingMock.data = data
        
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string:"https://www.test.com")!
        let actualData = try! await networkManager.getData(url: url)
        XCTAssertEqual(actualData, data)
    }

    func test_get_Feed_list_failes() async {
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string:"https://www.test.com")!
        
        do {
            let _ = try await networkManager.getData(url: url)
        }catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidURL)
        }
    }
}
