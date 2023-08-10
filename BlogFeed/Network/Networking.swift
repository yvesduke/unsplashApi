//
//  Networking.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation


protocol Networking {
    func data(from url: URL,delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}
extension Networking {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await data(from: url, delegate: nil)
    }
}
extension URLSession: Networking {}
