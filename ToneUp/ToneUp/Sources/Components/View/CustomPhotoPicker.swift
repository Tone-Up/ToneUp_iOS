//
//  CustomPhotoPicker.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import PhotosUI
import SwiftUI

public struct CustomPhotoPicker<Content: View>: View {
    
    @State private var selectedPhoto: PhotosPickerItem?
    @Binding private var selectedImage: UIImage?
    @Binding private var isPresentedError: Bool
    private let matching: PHPickerFilter
    private let photoLibrary: PHPhotoLibrary
    private let content: () -> Content
    
    public init(
        selectedImage: Binding<UIImage?>,
        isPresentedError: Binding<Bool> = .constant(false),
        matching: PHPickerFilter = .images,
        photoLibrary: PHPhotoLibrary = .shared(),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selectedPhoto = State(initialValue: nil)
        self._selectedImage = selectedImage
        self._isPresentedError = isPresentedError
        self.matching = matching
        self.photoLibrary = photoLibrary
        self.content = content
    }
    
    public var body: some View {
        PhotosPicker(
            selection: $selectedPhoto,
            matching: matching,
            photoLibrary: photoLibrary
        ) {
            content()
        }
        .onChange(of: selectedPhoto) { oldItem, newItem in
            guard let item = newItem else { return }
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data, let uiImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            selectedImage = uiImage
                            selectedPhoto = nil
                        }
                    } else {
                        DispatchQueue.main.async {
                            isPresentedError = true
                            selectedPhoto = nil
                        }
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        isPresentedError = true
                        selectedPhoto = nil
                    }
                }
            }
        }
    }
}
