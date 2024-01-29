//
//  LoadingModifier.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 29/01/2024.
//

import Foundation
import SwiftUI

struct LoadingModifier: ViewModifier {
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

extension View {
    func loadingModifier(isLoading: Binding<Bool>) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading))
    }
}
