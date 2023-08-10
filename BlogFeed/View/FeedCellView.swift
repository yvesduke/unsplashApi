//
//  FeedCellView.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import SwiftUI
import Foundation

struct FeedCellView: View {

    let feed: Feed

    var body: some View {
        VStack{
            if let url = URL(string: feed.user.profileImage.large){
                FeedAsyncImageView(url: url)
                    .frame(width: 180, height: 180)
                    .mask(RoundedRectangle(cornerRadius: 16))
                    .padding(3)
            }
            Divider().padding(18)
            Group{
                Text(NSLocalizedString("first_name", comment: ""))
                    .font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.firstName)").foregroundColor(.indigo)
                Text(NSLocalizedString("user_name", comment: ""))
                    .font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.username)").foregroundColor(.indigo)
                Text(NSLocalizedString("total_likes", comment: ""))
                    .font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.totalLikes)").foregroundColor(.indigo)
                Text(NSLocalizedString("location", comment: ""))
                    .font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.location ?? "Location Not Available")")
                Text(NSLocalizedString("created", comment: ""))
                    .font(.headline).foregroundColor(.cyan)
                let updated = feed.createdAt.components(separatedBy: "-")
                Text("\(updated[0])").foregroundColor(.indigo)
            }.padding(1)
        }
        .background(.yellow)
        .cornerRadius(9)
    }
}

struct FeedCellView_Previews: PreviewProvider {
    static var previews: some View {
        FeedCellView(feed: Feed.getMockFeed().first!)
    }
}
