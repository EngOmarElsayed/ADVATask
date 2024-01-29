//
//  UrlBuilder.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation

enum UrlBuilder {
    case photos
}

extension UrlBuilder: EndPoint {
    var finalURL: String {
        "https://jsonplaceholder.typicode.com/\(urlPath.rawValue)"
    }
    
    var urlPath: urlPath {
        switch self {
        case .photos:
            return .photos
        }
    }
}
