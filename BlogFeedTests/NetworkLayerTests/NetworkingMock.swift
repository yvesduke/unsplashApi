//
//  NetworkingMock.swift
//  BlogFeedTests
//
//  Created by Yves Dukuze on 10/08/2023.
//

import Foundation
@testable import BlogFeed

class NetworkingMock: Networking {
    static var data: Data?

    func data(from url: URL,
        delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.invalidURL
        }
        return (data, URLResponse())
    }
}
