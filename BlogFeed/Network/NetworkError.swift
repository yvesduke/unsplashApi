//
//  NetworkError.swift
//  BlogFeed
//
//  Created by Yves Dukuze on 09/08/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
}

extension NetworkError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("url is Invalid", comment: "url Error")
        }
    }
}
