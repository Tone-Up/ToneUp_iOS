//
//  HomeReducer.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI
import ComposableArchitecture

struct Home: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var userTone: UserTone = .spring
        var feed: FeedDTO? = nil
        var isLoading: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case tappedAnalyzeAgain
        case feedResponse(TaskResult<FeedDTO>)
//        case recommandResponse(TaskResult<RecommandProductDTO>)
    }
    
    @Dependency(\.feedClient) var feedClient
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                state.isLoading = true
                return .run { send in
//                    async let feedResult = TaskResult { try await feedClient.fetchFeed() }
//                    async let recResult  = TaskResult { try await recommandClient.fetchRecommand() }
//                    
//                    let (feedRes, recRes) = await (feedResult, recResult)
//                    
//                    await send(.feedResponse(feedRes))
//                    await send(.recommandResponse(recRes))
                    
                    await send(
                        .feedResponse(
                            TaskResult { try await feedClient.homeFeed()}
                        )
                    )
                }
                
            case .tappedAnalyzeAgain:
                return .none
                
            case .feedResponse(.success(let dto)):
                state.isLoading = false
                state.feed = dto
                return .none
                
            case .feedResponse(.failure):
                return .none
            }
        }
    }
    
}

enum UserTone: String {
    case spring = "봄웜"
    case summer = "여름쿨"
    case autumn = "가을웜"
    case winter = "겨울쿨"
    
    var color: Color {
        switch self {
        case .spring: return .pink
        case .summer: return .blue
        case .autumn: return .orange
        case .winter: return .cyan
        }
    }
}
