//
//  ContentView.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import SwiftUI

struct FeedListView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationStack{
            listView()
                .navigationTitle(NSLocalizedString("nav_title", comment: "Feed List navigation title"))
        }
        .task{
            await viewModel.getFeedList(url: ApiEndpoint.feedAPI)
        }
    }
    
    @ViewBuilder
    func listView()-> some View {
        switch viewModel.viewState {
        case .load(feeds: let feeds) :
            if feeds.count > 0 {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(feeds) { feed in
                            NavigationLink {
                                FeedDetailView(feed: feed)
                            } label: {
                                FeedCellView(feed: feed)
                            }
                        }
                    }
                }
            } else {
                Text(NSLocalizedString("loading_message", comment: ""))
            }
        case .error(message: let message) :
            Text(message)
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView(viewModel: FeedViewModel())
    }
}
