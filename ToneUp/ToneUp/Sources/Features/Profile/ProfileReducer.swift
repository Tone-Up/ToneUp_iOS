//
//  ProfileReducer.swift
//  ToneUp
//
//  Created by 전준영 on 6/30/25.
//

import SwiftUI
import ComposableArchitecture

struct Profile: Reducer {
    
    @ObservableState
    struct State: Equatable {
        //내 프로필 세팅
        var profile: ProfileDTO? = nil
        var nickname: String = ""
        var bio: String = ""
        var profileImageUrl: String = ""
        var isLoading: Bool = false
        //내 프로필 관리 버튼
        var isProfileSettingButtonTap: Bool = false
        var isStyleSettingButtonTap: Bool = false
        //내 게시물 세팅
        //내 스타일 세팅
        //프로필 변경 이미지 선택
        var selectedImage: UIImage? = nil
        var isGalleryErrorPresented = false
        var isEditTextFieldButtonTap: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case profileSettingButtonTapped
        case styleSettingButtonTapped
        case editTextFieldButtonTapped
        case galleryImagePicked(UIImage)
        case galleryError
        case profileResponse(TaskResult<ProfileDTO>)
        case profileUpdateResponse(TaskResult<Void>)
    }
    
    @Dependency(\.profileClient) var profileClient
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                state.isLoading = true
                return .run { send in
                    await send(
                        .profileResponse(
                            TaskResult { try await profileClient.myProfile() }
                        )
                    )
                }
                
            case .profileSettingButtonTapped:
                state.isProfileSettingButtonTap = true
                return .none
                
            case .profileResponse(.success(let dto)):
                state.isLoading = false
                state.profile = dto
                state.nickname = dto.nickname
                state.bio = dto.bio
                state.profileImageUrl = dto.profileImageUrl
                return .none
                
            case .profileResponse(.failure):
                state.isLoading = false
                return .none
                
            case .styleSettingButtonTapped:
                state.isStyleSettingButtonTap = true
                return .none
                
            case .galleryImagePicked(let image):
                print(image)
                state.selectedImage = image
                return .none
                
            case .galleryError:
                state.isGalleryErrorPresented = true
                return .none
                
            case .editTextFieldButtonTapped:
                let nickname = state.nickname
                let bio = state.bio
                
                state.isEditTextFieldButtonTap = true
                return .run { send in
                    await send(
                        .profileUpdateResponse(
                            TaskResult { try await profileClient.updateProfile(nickname, bio) }
                        )
                    )
                }
                
            case .profileUpdateResponse(.success):
                return .none
                
            case .profileUpdateResponse(.failure):
                return .none
            }
            
        }
    }
    
}
