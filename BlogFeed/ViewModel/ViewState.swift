//
//  ViewState.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 10/08/2023.
//

import Foundation

enum ViewState: Equatable {
    case load(feeds: [Feed])
    case error(message: String)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.load(feeds: let lFeeds), .load(feeds: let rFeeds)):
            return lFeeds.count == rFeeds.count
         
        case (.error(message: let lMessage), .error(message: let rMessage)):
            return lMessage == rMessage
        case (.error(message:  _), .load(feeds: _)):
            return false
        case (.load(feeds:  _), .error(message: _)):
            return false
        }
    }
}
