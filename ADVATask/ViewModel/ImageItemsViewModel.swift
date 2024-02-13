//
//  ImageItemsViewModel.swift
//  ADVATask
//
//  Created by Eng.Omar Elsayed on 28/01/2024.
//

import Foundation


final class ImageItemsViewModel: ObservableObject {
    @Published var imagesDisplayed = [ImageItem]()
    @Published var isLoading = false
    
    private var range = 1
}

//MARK: -  MainFuncations
extension ImageItemsViewModel {

     func loadImageItems() async {
        do {
            await toggleisLoading()
            let imagesArray = try await load()
            await updateArray(consume imagesArray)
            await toggleisLoading()
        } catch {
            print(error.localizedDescription)
            await toggleisLoading()
        }
    }
    
    func checkForPagination(_ item: ImageItem) {
        if isItemLastInArray(item) {
            Task {
                await loadMore()
            }
        }
    }
    
    func loadMore() async {
        do {
            let imagesArray = try await load()
            await updateArray(imagesArray)
        } catch {
            print("Loading Error")
        }
    }
    
}

//MARK: -  RemoteLoader
extension ImageItemsViewModel: RemoteLoader {
  private func load() async throws -> [ImageItem] {
      try await self.loadSpecificSetOfItems(range: range...range+9, for: ImageItem.self).sorted(by: { $0.id < $1.id })
    }
}

//MARK: -  MainActorsFuncations
extension ImageItemsViewModel {
    @MainActor
    func updateArray(_ arrayItems: [ImageItem]) {
        range += 10
        imagesDisplayed += arrayItems
    }
    
    @MainActor
    private func toggleisLoading() {
        isLoading.toggle()
    }
}

//MARK: -  PrivateHlepers
private extension ImageItemsViewModel {
    private func isItemLastInArray(_ item: ImageItem) -> Bool {
        return item.id == imagesDisplayed.last?.id
    }
}
