//
//  ImageItemsViewModel.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation


final class ImageItemsViewModel: ObservableObject {
    @Published var imagesDisplayed = [ImageItem]()
    @Published var image: String = "https://via.placeholder.com/600/92c952"
    @Published var isFullScreen = false
    @Published var isLoading = false
    
    private var imagesArray = [ImageItem]()
    private var range = 0
    private let remoteloader: ImageItemsLoderProtocol = ImageItemsRemoteLoader()
}

extension ImageItemsViewModel {
    func isItemLastInArray(_ item: ImageItem) -> Bool {
        return item.id == imagesDisplayed.last?.id
    }
    
     func loadImageItems() async {
        do {
            await toggleisLoading()
            imagesArray = try await load()
            await updateArray()
            await toggleisLoading()
        } catch {
            print(error.localizedDescription)
            await toggleisLoading()
        }
    }
}

//MARK: -  RemoteLoader
extension ImageItemsViewModel {
  private func load() async throws -> [ImageItem] {
        try await remoteloader.load()
    }
}

//MARK: -  MainActors
extension ImageItemsViewModel {
    @MainActor
    func updateArray() {
        for i in range...range+9 {
            imagesDisplayed.append(imagesArray[i])
        }
        range += 9
    }
    
    @MainActor
    private func toggleisLoading() {
        isLoading.toggle()
    }
}
