//
//  ContentView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    @State private var isShowingOnboarding: Bool = true
    @ObservedObject private var learnerStore = LearnerStore()

    var body: some View {
        TabView {
            Tab {
                SpaceView(
                    learnerStore: learnerStore,
                    learner: $learnerStore.mainLearner
                )
            } label: {
                Label("My Space", systemImage: "star.fill")
            }
            Tab {
                ExploreView(learnerStore: learnerStore)
            } label: {
                Label("Explore", systemImage: "magnifyingglass")
            }
        }
        .onAppear {
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            }
        }
        .sheet(isPresented: $isShowingOnboarding) {
            OnboardingPage(
                isShowingOnboarding: $isShowingOnboarding,
                nickname: $learnerStore.mainLearner.name
            )
            .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ContentView()
}
