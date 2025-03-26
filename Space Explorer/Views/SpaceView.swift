//
//  SpaceView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import SwiftUI

struct SpaceView: View {
    @Namespace var namespace
    @ObservedObject var learnerStore: LearnerStore
    @Binding var learner: Learner

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

                ZStack {
                    Color.clear
                    VStack {
                        HStack {
                            Text("길을 밝혀줄 빛나는 목표로\n당신의 우주를 반짝이게 채워보세요")
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                }

                Image(.earth)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)

                NavigationLink {
                    PlanetDetailView(
                        learnerStore: learnerStore,
                        learner: $learner,
                        planet: .Design
                    )
                    .navigationTransition(
                        .zoom(sourceID: Planet.Design, in: namespace)
                    )
                } label: {
                    VStack {
                        Image(.design)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .matchedTransitionSource(
                                id: Planet.Design,
                                in: namespace
                            )
                        Text("Design")
                            .foregroundStyle(.design)
                    }
                }
                .offset(
                    x: 100,
                    y: -200
                )

                NavigationLink {
                    PlanetDetailView(
                        learnerStore: learnerStore,
                        learner: $learner,
                        planet: .Tech
                    )
                    .navigationTransition(
                        .zoom(sourceID: Planet.Tech, in: namespace)
                    )
                } label: {
                    VStack {
                        Image(.tech)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .matchedTransitionSource(
                                id: Planet.Tech,
                                in: namespace
                            )
                        Text("Tech")
                            .foregroundStyle(.tech)
                    }
                }
                .offset(
                    x: -100,
                    y: 200
                )

                NavigationLink {
                    PlanetDetailView(
                        learnerStore: learnerStore,
                        learner: $learner,
                        planet: .Business
                    )
                    .navigationTransition(
                        .zoom(sourceID: Planet.Business, in: namespace)
                    )
                } label: {
                    VStack {
                        Image(.business)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .matchedTransitionSource(
                                id: Planet.Business,
                                in: namespace
                            )
                        Text("Business")
                            .foregroundStyle(.business)
                    }
                }
                .offset(
                    x: 100,
                    y: 250
                )
            }
            .navigationTitle("\(learner.name)'s Space")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    @ObservedObject var learnerStore = LearnerStore()
    SpaceView(learnerStore: learnerStore, learner: $learnerStore.mainLearner)
}
