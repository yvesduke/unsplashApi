//
//  FeedRepository.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation
import Combine

protocol FeedRepositoryContract {
    func getList(for url: URL) async throws -> [Feed]
}

struct FeedRepository {
    private let networkManager: Networkable
    init(networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension FeedRepository: FeedRepositoryContract {
    func getList(for url: URL) async throws -> [Feed] {
        let listsData = try await networkManager.getData(url: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let lists = try decoder.decode([Feed].self, from: listsData)
        return lists
    }
}
