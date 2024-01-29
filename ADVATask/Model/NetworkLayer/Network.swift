//
//  Network.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation

protocol Network: NetworkProtocol {}

extension Network {
    func loadFrom<T>(path: UrlBuilder) async throws -> T where T : Codable {
        guard let url = URL(string: path.finalURL) else { throw networkError.invailedUrl }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw networkError.invailedResponse }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}

private enum networkError: Error {
     case invailedUrl
     case invailedResponse
 }
