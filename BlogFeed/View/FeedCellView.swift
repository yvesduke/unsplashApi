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
                Text("First Name: ").font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.firstName)").foregroundColor(.indigo)
                Text("User Name: ").font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.username)").foregroundColor(.indigo)
                Text("Total Likes: ").font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.totalLikes)").foregroundColor(.indigo)
                Text("Location: ").font(.headline).foregroundColor(.cyan)
                Text("\(feed.user.location ?? "Location Not Available")")
                Text("Created: ").font(.headline).foregroundColor(.cyan)
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
        
        FeedCellView(feed: Feed(id: "", slug: "", width: 3, height: 3, color: "", blurHash: "", description: "", altDescription: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), links: FeedLinks(html: "", download: "", downloadLocation: ""), likes: 3, likedByUser: false, sponsor: Sponsorship(impressionUrls: [], tagline: "", taglineUrl: "", sponsor: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: ""))), user: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: "")), createdAt: "", updatedAt: ""))
        
        
    }
}
