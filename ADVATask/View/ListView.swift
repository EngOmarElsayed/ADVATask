//
//  ContentView.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 27/01/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ImageItemsViewModel
    let colums = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            if vm.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                LazyVGrid(columns: colums) {
                    ForEach(vm.imagesDisplayed, id: \.id) { item in
                        CellView(isFullScreen: $vm.isFullScreen, image: $vm.image ,imageItem: item)
                            .onAppear(perform: {
                                if vm.isItemLastInArray(item) {
                                    vm.updateArray()
                                }
                            })
                    }
                }.padding(.vertical)
            }
        }
        .navigationTitle("Images")
        .fullScreenCover(isPresented: $vm.isFullScreen, content: {
            ImageMagnificationView(isFullScreen: $vm.isFullScreen, image: vm.image)
        })
    }
    
}

#Preview {
    NavigationStack {
        ListView()
    }
}
