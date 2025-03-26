//
//  ExploreView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import SwiftUI

struct ExploreView: View {
    @Namespace var namespace
    @ObservedObject var learnerStore: LearnerStore
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(
                                .displayP3, red: 0, green: 26 / 255,
                                blue: 93 / 255
                            ),
                            Color.black,
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                        ForEach(0..<learnerStore.learners.count, id: \.self) { index in
                            let learner = learnerStore.learners[index]
                            NavigationLink {
                                SpaceView(
                                    learnerStore: learnerStore,
                                    learner: learnerStore
                                        .getBindingLearner(learner)
                                )
                                    .navigationTransition(
                                        .zoom(sourceID: index, in: namespace)
                                    )
                            } label: {
                                VStack {
                                    Image(.earth)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                    Text(learner.name)
                                        .foregroundStyle(.white)
                                }
                                .matchedTransitionSource(id: index, in: namespace)
                                .padding()
                            }
                        }
                    }
                    .padding()
                }
                .searchable(
                    text: .constant("")
                )
            }
            .navigationTitle("Explore")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ExploreView(learnerStore: LearnerStore())
}
