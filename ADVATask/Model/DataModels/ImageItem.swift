//
//  ImageItem.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import Foundation


struct ImageItem: Codable {
    var id: Int
    var title: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case title, id
        case image = "url"
    }
}
