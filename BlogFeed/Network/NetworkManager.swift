//
//  NetworkManager.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation

protocol Networkable {
    func getData(url: URL) async throws -> Data
}

final class NetworkManager: Networkable {
    private let urlSession: Networking

    init(urlSession: Networking =  URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func getData(url: URL) async throws -> Data {
        let (data, _) = try await urlSession.data(from: url)
        return data
    }
}
