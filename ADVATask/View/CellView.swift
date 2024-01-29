//
//  CellView.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

struct CellView: View {
    
    let imageItem: ImageItem
    
    var body: some View {
        Group {
            KingFisherImageView(imageUrl: imageItem.image)
                .overlay(alignment: .bottomLeading){
                            Text(imageItem.title)
                                .font(.title)
                                .fontDesign(.rounded)
                                .padding()
                                .lineLimit(1)
                }
                .scaledToFit()
                .frame(width: 300, height: 300)
                .mask {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                }
        }
        .padding()
    }
}


