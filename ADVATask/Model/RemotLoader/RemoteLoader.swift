//
//  ImageItemsRemoteLoader.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation

protocol RemoteLoader: Network {}

extension RemoteLoader {
    func loadItems<T>(from url: UrlBuilder) async throws -> T where T : Codable {
        return try await self.loadFrom(path: url)
    }
}
