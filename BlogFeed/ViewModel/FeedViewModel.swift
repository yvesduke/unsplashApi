//
//  BlogViewModel.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation
import Combine

protocol FeedViewModelAction: ObservableObject {
    func getFeedList(url: String) async
}

final class FeedViewModel {
    private var feeds: [Feed] = []
    private let repository: FeedRepositoryContract
    
    @Published var viewState: ViewState = .load(feeds: [])
    
    init(repository: FeedRepositoryContract = FeedRepository()) {
        self.repository = repository
    }
}

extension FeedViewModel: FeedViewModelAction {
    func getFeedList(url: String) async {
        guard let url = URL(string: url) else {
            viewState = .error(message:"Invalid URL")
            return
        }
        do {
            feeds = try await repository.getList(for: url)
            await MainActor.run {
                viewState = .load(feeds: feeds)
            }
        } catch {
            await MainActor.run {
                viewState = .error(message:"Something went wrong, Pls try again")
            }
        }
    }
}
