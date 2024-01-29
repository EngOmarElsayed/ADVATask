//
//  ContentView.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm: ImageItemsViewModel
    @State private var image: String = "https://via.placeholder.com/600/92c952"
    
    @State private var isFullScreen = false
    let colums = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(vm.imagesDisplayed, id: \.id) { item in
                        CellView(imageItem: item)
                            .onTapGesture {
                                image = item.image
                                isFullScreen.toggle()
                            }
                            .onAppear(perform: {
                                vm.checkForPagination(item)
                            })
                    }
                }.padding(.vertical)
        }
        .navigationTitle("Images")
        .loadingModifier(isLoading: $vm.isLoading)
        .fullScreenCover(isPresented: $isFullScreen, content: {
            ImageMagnificationView(isFullScreen: $isFullScreen, image: image)
        })
        .task {
            await vm.loadImageItems()
        }
    }
    
}

