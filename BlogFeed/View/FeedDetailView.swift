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
                    .fontWidth(.condensed)
                if let url = URL(string: feed.user.profileImage.large){
                    FeedAsyncImageView(url: url)
                        .frame(width: 180, height: 180)
                        .mask(RoundedRectangle(cornerRadius: 16))
                }
                Divider()
                Group {
                    Text("Description").font(.headline).foregroundColor(.cyan).fontWidth(.condensed)
                        Text(feed.description?.description ?? "NONE").foregroundColor(.indigo)
                    Text("Bio").font(.headline).foregroundColor(.cyan).fontWidth(.condensed)
                    Text("\(feed.user.bio ?? "Bio not Available")").foregroundColor(.indigo)
                    Text("Info").font(.headline).foregroundColor(.cyan).fontWidth(.condensed)
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
        
        FeedDetailView(feed: Feed(id: "", slug: "", width: 3, height: 3, color: "", blurHash: "", description: "", altDescription: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), links: FeedLinks(html: "", download: "", downloadLocation: ""), likes: 3, likedByUser: false, sponsor: Sponsorship(impressionUrls: [], tagline: "", taglineUrl: "", sponsor: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: ""))), user: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: "")), createdAt: "", updatedAt: ""))
    }
}
