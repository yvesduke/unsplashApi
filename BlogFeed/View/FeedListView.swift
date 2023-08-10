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
            switch viewModel.viewState {
            case .load(feeds: let feeds) :
                if feeds.count > 0 {
                    ScrollView(.horizontal){
                        LazyHStack {
                            ForEach(feeds){ feed in
                                NavigationLink {
                                    FeedDetailView(feed: feed)
                                } label: {
                                    FeedCellView(feed: feed)
                                }
                            }
                        }
                    }
                }else{
                    Text("Loading..")
                }
            case .error(message: let message) :
                Text(message)
            }
        }
        .navigationTitle(Text("Blog Feeds"))
        .task{
            await viewModel.getFeedList(url: ApiEndpoint.feedAPI)
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView(viewModel: FeedViewModel())
    }
}
