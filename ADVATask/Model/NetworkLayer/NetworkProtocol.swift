//
//  NetworkProtocol.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation

protocol NetworkProtocol {
    func loadFrom<T: Codable>(path: UrlBuilder) async throws -> T
}
