//
//  BlogFeedApp.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import SwiftUI

@main
struct BlogFeedApp: App {
    var body: some Scene {
        WindowGroup {
            FeedListView(viewModel: FeedViewModel())
        }
    }
}
