//
//  FakeNetworkManager.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import Foundation
@testable import BlogFeed

class FakeNetworkManager: Networkable {
    
    func getData(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.invalidURL
        }
    }
}
