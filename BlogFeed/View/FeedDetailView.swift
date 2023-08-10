//
//  FeedDetailView.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import SwiftUI

struct FeedDetailView: View {
    let feed: Feed
    var body: some View {
        VStack {
            ScrollView {
                Text("\(feed.user.name)".uppercased())
                    .foregroundColor(.cyan)
                    .font(.headline)
                if let url = URL(string: feed.user.profileImage.large){
                    FeedAsyncImageView(url: url)
                        .frame(width: 180, height: 180)
                        .mask(RoundedRectangle(cornerRadius: 16))
                }
                Divider()
                Group {
                    Text(NSLocalizedString("description", comment: ""))
                        .font(.headline).foregroundColor(.cyan)
                        Text(feed.description?.description ?? "NONE").foregroundColor(.indigo)
                    Text(NSLocalizedString("bio", comment: ""))
                        .font(.headline).foregroundColor(.cyan)
                    Text("\(feed.user.bio ?? "Bio not Available")").foregroundColor(.indigo)
                    Text(NSLocalizedString("info", comment: ""))
                        .font(.headline).foregroundColor(.cyan)
                        if let aldDescr = feed.altDescription{
                            Text(aldDescr).foregroundColor(.indigo)
                        }
                }.padding(3)
            }.padding()
        }
        .background(.yellow)
        .cornerRadius(9)
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView(feed: Feed.getMockFeed().first!)
    }
}
