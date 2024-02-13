//
//  NetworkProtocol.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation

protocol NetworkProtocol {
    var urlSession: URLSession { get }
    func loadFor<T: Codable>(path: UrlBuilder) async throws -> T
}

extension NetworkProtocol {
    var urlSession: URLSession {
        URLSession.shared
    }
}
