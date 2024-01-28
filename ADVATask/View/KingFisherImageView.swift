//
//  KingFisherImageView.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import SwiftUI
import Kingfisher

struct KingFisherImageView: View {
    let imageUrl: String
    var body: some View {
        if let url = URL(string: imageUrl) {
            KFImage(url)
                .resizable()
                .cancelOnDisappear(true)
        }
    }
}
