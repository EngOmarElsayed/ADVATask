//
//  UrlBuilder.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation

enum UrlBuilder {
    case photos
    case specificPhotos(imageId: Int)
}

extension UrlBuilder: EndPoint {
    var finalURL: String {
        switch urlPath {
        case .photos:
           return "https://jsonplaceholder.typicode.com/photos"
        case let .specificPhotos(imageId):
            return "https://jsonplaceholder.typicode.com/photos/\(imageId)"
        }
    }
    
    var urlPath: urlPath {
        switch self {
        case .photos:
            return .photos
        case let .specificPhotos(imageId):
            return .specificPhotos(imageId: imageId)
        }
    }
}
