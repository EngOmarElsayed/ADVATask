//
//  ImageItemsViewModel.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation


final class ImageItemsViewModel: ObservableObject, RemoteLoader {
    @Published var imagesDisplayed = [ImageItem]()
    @Published var isLoading = false
    
    private var imagesArray = [ImageItem]()
    private var range = 0
}

extension ImageItemsViewModel {

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
    
    func checkForPagination(_ item: ImageItem) {
        if isItemLastInArray(item) {
            Task {
                await updateArray()
            }
        }
    }
}

//MARK: -  RemoteLoader
extension ImageItemsViewModel {
  private func load() async throws -> [ImageItem] {
      try await self.loadItems(from: .photos)
    }
    
    private func isItemLastInArray(_ item: ImageItem) -> Bool {
        return item.id == imagesDisplayed.last?.id
    }
}

//MARK: -  MainActors
extension ImageItemsViewModel {
    @MainActor
    func updateArray() {
        for i in range...range+9 {
            imagesDisplayed.append(imagesArray[i])
        }
        range += 10
    }
    
    @MainActor
    private func toggleisLoading() {
        isLoading.toggle()
    }
}
