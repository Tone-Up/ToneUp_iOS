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
        var personalColor: String? = nil
        var isLoading = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case cameraButtonTapped
        case galleryButtonTapped
        case galleryImagePicked(UIImage)
        case galleryError
        case analysisResponse(TaskResult<String>)
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
                
//            case .galleryImagePicked(let image):
//                state.selectedImage = image
//                state.isLoading = true
//                return .run { send in
//                    await send(
//                        .analysisResponse(
//                            TaskResult {
//                                guard let data = image.jpegData(compressionQuality: 0.8) else {
//                                    throw ColorAnalysisError.missingData
//                                }
//                                return try await colorAnalysisClient.analytic(data)
//                            }
//                        )
//                    )
//                }
            case .galleryImagePicked(let image):
              guard let small = image.resized(to: 1024),
                    let data = small.jpegData(compressionQuality: 0.3)
              else {
                state.isGalleryErrorPresented = true
                return .none
              }

              state.selectedImage = small
              state.isLoading = true

              return .run { send in
                await send(
                  .analysisResponse(
                    TaskResult {
                      try await colorAnalysisClient.analytic(data)
                    }
                  )
                )
              }

                
            case .galleryError:
                state.isGalleryErrorPresented = true
                return .none
                
            case .analysisResponse(.failure(let error)):
                print("❌ 분석 중 에러 발생:", error)
                state.isLoading = false
                state.isGalleryErrorPresented = true
                return .none
                
            case .analysisResponse(.success(let colorString)):
                state.isLoading = false
                state.personalColor = colorString
                print("🎨 퍼스널 컬러 분석 결과:", colorString)
                return .none
            }
        }
    }
    
}

extension UIImage {
    func resized(to maxWidth: CGFloat) -> UIImage? {
        guard size.width > maxWidth else { return self }
        let aspect = size.height / size.width
        let newSize = CGSize(width: maxWidth, height: maxWidth * aspect)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
