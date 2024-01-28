//
//  ImageView.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

struct ImageMagnificationView: View {
    @State var zoomEffect = 0.0
    @State var totalEffect = 1.0
    
    @Binding var isFullScreen: Bool
    let image: String
    
    var body: some View {
        
        ZStack {
                KingFisherImageView(imageUrl: image)
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(totalEffect+zoomEffect)
                    .gesture(
                        MagnifyGesture()
                            .onChanged({ amount in
                                zoomEffect = amount.magnification - 1
                            })
                            .onEnded({ _ in
                                totalEffect += zoomEffect
                                zoomEffect = 0
                            })
                    )
                    .mask {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                    }
                
                Button(action: {
                    isFullScreen.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundStyle(.black)
                        .padding()
                        .background(.thinMaterial, in: Circle())
                }).offset(x: UIScreen.main.bounds.width*0.4, y: -UIScreen.main.bounds.height*0.4)

        }
            
    }
    
}

