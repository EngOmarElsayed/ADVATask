//
//  ADVATaskApp.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

@main
struct ADVATaskApp: App {
    @StateObject var vm = ImageItemsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
                    .environmentObject(vm)
                    .task {
                        await vm.loadImageItems()
                    }
            }
        }
    }
}
