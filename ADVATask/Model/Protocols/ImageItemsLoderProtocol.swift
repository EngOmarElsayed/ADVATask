//
//  ImageItemsLoder.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation

protocol ImageItemsLoderProtocol {
    func load() async throws -> [ImageItem]
}
