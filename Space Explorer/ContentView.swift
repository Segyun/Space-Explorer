//
//  ContentView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>)
        -> UIVisualEffectView
    {
        UIVisualEffectView()
    }

    func updateUIView(
        _ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>
    ) {
        uiView.effect = effect
    }
}

struct ContentView: View {
    @Namespace private var namespace
    @State private var isShowingOnboarding: Bool = true
    @State private var isShowingSpaceView: Bool = true

    var body: some View {
        if isShowingOnboarding {
            OnboardingPage(
                namespace: namespace,
                isShowingOnboarding: $isShowingOnboarding
            )
        } else {
            ZStack {
                if isShowingSpaceView {
                    SpaceView(namespace: namespace)
                } else {
                    ExploreView()
                }
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            isShowingSpaceView = true
                        } label: {
                            Label(
                                "Your Space",
                                systemImage: "globe.asia.australia.fill"
                            )
                        }
                        .padding()
                        Spacer()
                        Button {
                            isShowingSpaceView = false
                        } label: {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
                        .padding()
                    }
                    .padding(
                        .bottom,
                        UIApplication.shared.keyWindow?.safeAreaInsets.bottom
                    )
                    .background {
                        VisualEffectView(
                            effect: UIBlurEffect(style: .systemMaterial)
                        )
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
}
