//
//  FeedModel.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation

// MARK: - Feed
struct Feed: Decodable, Identifiable {
    let id, slug: String
    let width, height: Int
    let color, blurHash: String
    let description: String?
    let altDescription: String?
    let urls: Urls
    let links: FeedLinks
    let likes: Int
    let likedByUser: Bool
    let sponsor: Sponsorship?
    let user: User
    let createdAt: String
    let updatedAt: String
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - FeedLinks
struct FeedLinks: Decodable {
    let html, download, downloadLocation: String
}

// MARK: - Sponsorship
struct Sponsorship: Decodable {
   let impressionUrls: [String]
    let tagline: String
    let taglineUrl: String
    let sponsor: User
}

// MARK: - User
struct User: Decodable, Identifiable {
    let id: String
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool
    let social: Social
}

// MARK: - UserLinks
struct UserLinks: Decodable {
    let html, photos, likes: String
    let portfolio, following, followers: String
}

// MARK: - ProfileImage
struct ProfileImage: Decodable {
    let small, medium, large: String
}

// MARK: - Social
struct Social: Decodable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
}

// MARK: - TexturesPatterns
struct TexturesPatterns: Decodable {
    let status: String
    let approvedOn: Date?
}

// MARK: - Urls
struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb, smallS3: String
}

extension Feed {
    static func getMockFeed()-> [Feed] {
        return [Feed(id: "", slug: "", width: 3, height: 3, color: "", blurHash: "", description: "", altDescription: "", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), links: FeedLinks(html: "", download: "", downloadLocation: ""), likes: 3, likedByUser: false, sponsor: Sponsorship(impressionUrls: [], tagline: "", taglineUrl: "", sponsor: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: ""))), user: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: "")), createdAt: "", updatedAt: "")]
    }
}
