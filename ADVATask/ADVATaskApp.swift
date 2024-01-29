//
//  ADVATaskApp.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

@main
struct ADVATaskApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView(vm: ImageItemsViewModel())
            }
        }
    }
}
