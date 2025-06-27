//
//  AnalyzeReducer.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import SwiftUI
import ComposableArchitecture

struct Analyze: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var isCameraButtonTapped: Bool = false
        var isGalleryButtonTapped: Bool = false
        var selectedImages: [UIImage] = []
        var isGalleryErrorPresented = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case cameraButtonTapped
        case galleryButtonTapped
        case galleryImagePicked([UIImage])
        case galleryError
    }
    
//    @Dependency(\.) var analyzeEnvironment
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .cameraButtonTapped:
                state.isCameraButtonTapped = true
                return .none
                
            case .galleryButtonTapped:
                state.isGalleryButtonTapped = true
                return .none
                
            case .galleryImagePicked(let images):
                state.selectedImages = images
                state.isGalleryButtonTapped = false
                return .none
                
            case .galleryError:
                state.isGalleryErrorPresented = true
                return .none
            }
        }
    }
    
}
