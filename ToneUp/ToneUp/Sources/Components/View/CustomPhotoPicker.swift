//
//  CustomPhotoPicker.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import PhotosUI
import SwiftUI

public struct CustomPhotoPicker<Content: View>: View {
    
    private let matching: PHPickerFilter
    private let photoLibrary: PHPhotoLibrary
    private let maxCount: Int
    private let content: () -> Content
    
    @Binding private var singleItem: PhotosPickerItem?
    @Binding private var singleImage: UIImage?
    
    @Binding private var multipleItems: [PhotosPickerItem]
    @Binding private var multipleImages: [UIImage]
    
    public init(
        selectedItem: Binding<PhotosPickerItem?>,
        selectedImage: Binding<UIImage?>,
        isPresentedError: Binding<Bool> = .constant(false),
        matching: PHPickerFilter = .images,
        photoLibrary: PHPhotoLibrary = .shared(),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._singleItem = selectedItem
        self._singleImage = selectedImage
        self._multipleItems = .constant([])
        self._multipleImages = .constant([])
        self.maxCount = 1
        self.matching = matching
        self.photoLibrary = photoLibrary
        self.content = content
    }
    
    public init(
        selectedItems: Binding<[PhotosPickerItem]>,
        selectedImages: Binding<[UIImage]>,
        maxCount: Int = 5,
        isPresentedError: Binding<Bool> = .constant(false),
        matching: PHPickerFilter = .images,
        photoLibrary: PHPhotoLibrary = .shared(),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._multipleItems = selectedItems
        self._multipleImages = selectedImages
        self._singleItem = .constant(nil)
        self._singleImage = .constant(nil)
        self.maxCount = maxCount
        self.matching = matching
        self.photoLibrary = photoLibrary
        self.content = content
    }
    
    public var body: some View {
        Group {
            if maxCount == 1 {
                PhotosPicker(
                    selection: $singleItem,
                    matching: matching,
                    photoLibrary: photoLibrary
                ) {
                    content()
                }
                .onChange(of: singleItem) { item in
                    guard let item = item else { return }
                    loadSingle(item)
                }
                
            } else {
                PhotosPicker(
                    selection: $multipleItems,
                    maxSelectionCount: maxCount,
                    matching: matching,
                    photoLibrary: photoLibrary
                ) {
                    content()
                }
                .onChange(of: multipleItems) { items in
                    syncMultiple(items)
                }
            }
        }
    }
    
    private func loadSingle(_ item: PhotosPickerItem) {
        item.loadTransferable(type: Data.self) { result in
            if case .success(let data?) = result,
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    singleImage = image
                    singleItem = nil
                }
            } else {
                DispatchQueue.main.async { singleItem = nil }
            }
        }
    }
    
    private func syncMultiple(_ items: [PhotosPickerItem]) {
        DispatchQueue.main.async {
            multipleImages = []
        }
        for (index, item) in items.enumerated() {
            item.loadTransferable(type: Data.self) { result in
                if case .success(let data?) = result,
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        let insertIndex = min(index, multipleImages.count)
                        multipleImages.insert(image, at: insertIndex)
                    }
                }
            }
        }
    }
    
}
