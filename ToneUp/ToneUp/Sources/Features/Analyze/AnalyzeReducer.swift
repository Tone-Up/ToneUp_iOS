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
        var selectedImage: UIImage? = nil
        var isGalleryErrorPresented = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case cameraButtonTapped
        case galleryButtonTapped
        case galleryImagePicked(UIImage)
        case galleryError
        case analysisResponse(TaskResult<PersonalColorDTO>)
    }
    
    @Dependency(\.colorAnalysisClient) var colorAnalysisClient
    
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
                
            case .galleryImagePicked(let image):
                print(image)
                state.selectedImage = image
//                state.isGalleryButtonTapped = false
                return .run { send in
                    await send(
                        .analysisResponse(
                            TaskResult {
                                guard let data = image.jpegData(compressionQuality: 0.8) else {
                                    throw ColorAnalysisError.missingData
                                }
                                return try await colorAnalysisClient.analytic(data)
                            }
                        )
                    )
                }
                
            case .galleryError:
                state.isGalleryErrorPresented = true
                return .none
                
            case .analysisResponse(.failure(let error)):
                print("❌ 분석 중 에러 발생:", error)
                state.isGalleryErrorPresented = true
                return .none
                
            case .analysisResponse(.success(let dto)):
                print("🎨 퍼스널 컬러 분석 결과:", dto)
                return .none
            }
        }
    }
    
}
