//
//  ImageItem.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import Foundation


struct ImageItem: Decodable {
    var id: Int
    var title: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case image = "url"
    }
}
