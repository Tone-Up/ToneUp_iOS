//
//  PostReducer.swift
//  ToneUp
//
//  Created by 전준영 on 7/8/25.
//

import SwiftUI
import ComposableArchitecture

struct Post: Reducer {
    
    @ObservableState
    struct State: Equatable {
        ///피드인지 내스타일인지 선택
        var postType: PostType = .feed
        ///이미지 선택(여러장 가능)
        var images: [UIImage] = []
        ///제목
        var title: String = ""
        ///설명
        var description: String = ""
        ///작성완료 버튼
        var isWriteButtonTap: Bool = false
        var isLoading = false
        var didPostSuccess = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case selectPostType(PostType)
        case isWriteButtonTapped
        case postResponse(TaskResult<PostDTO>)
    }
    
    @Dependency(\.postClient) var postClient
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .selectPostType(let type):
                state.postType = type
                return .none
                
            case .isWriteButtonTapped:
                state.isLoading = true
                
                let description = state.description
                let datas: [Data] = state.images.compactMap { image in
                    image.resized(to: 1024)?.jpegData(compressionQuality: 0.3)
                }
                
                return .run { send in
                    await send(
                        .postResponse(
                            TaskResult {
                                try await postClient.feed(datas, description)
                            }
                        )
                    )
                }
                
            case .postResponse(.failure(let error)):
                state.isLoading = false
                state.didPostSuccess = false
                return .none
                
            case .postResponse(.success(let response)):
                state.isLoading = false
                state.didPostSuccess = true
                print("성공성공성공성공성공성공성공성공")
                return .none
            }
        }
    }
    
}
