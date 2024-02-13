//
//  ImageItemsRemoteLoader.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation

protocol RemoteLoader: Network {
    func loadSpecificSetOfItems<T>(range: ClosedRange<Int>, for type: T.Type) async throws -> [T] where T: Codable
}

extension RemoteLoader {
    func loadAllItems<T>(from url: UrlBuilder) async throws -> T where T : Codable {
        return try await self.loadFor(path: url)
    }
    
    func loadSpecificSetOfItems<T: Codable>(range: ClosedRange<Int>, for type: T.Type) async throws -> [T] where T: Codable {
        try await withThrowingTaskGroup(of: T.self, returning: [T].self) { taskGroup in
            for id in range {
                taskGroup.addTask {
                    return try await self.loadFor(path: .specificPhotos(imageId: id))
                }
            }
            return try await taskGroup.reduce(into: [T]()) { result, item in
                result.append(item)
            }
        }
    }
    
}
