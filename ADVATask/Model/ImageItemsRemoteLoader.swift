//
//  ImageItemsRemoteLoader.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation

final class ImageItemsRemoteLoader {
   private let url = "https://jsonplaceholder.typicode.com/photos"
   private typealias ApiResponseType = [ImageItem]
}

extension ImageItemsRemoteLoader: ImageItemsLoderProtocol {
    func load() async throws -> [ImageItem] {
        guard let url = URL(string: url) else { throw networkError.invailedUrl }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw networkError.invailedResponse }
        
        return try JSONDecoder().decode(ApiResponseType.self, from: data)
    }
}

extension ImageItemsRemoteLoader {
   private enum networkError: Error {
        case invailedUrl
        case invailedResponse
    }
}
