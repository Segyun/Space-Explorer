//
//  PlanetDetailView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct PlanetDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var learnerStore: LearnerStore
    @Binding var learner: Learner

    var planet: Planet?

    let baseRadius: CGFloat = 200
    let spacing: CGFloat = 100

    @State private var selectedGoalID = UUID()
    @State private var isShowingDetail: Bool = false
    @State private var isShowingAdding: Bool = false
    @State private var title: String = ""

    var body: some View {
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
            GeometryReader { geometry in
                ZStack {
                    Image(planet?.image ?? .goal)
                        .resizable()
                        .scaledToFit()

                    ForEach(
                        0 ..< learnerStore
                            .getGoalsFromLearner(
                                $learner,
                                planet: planet!
                            ).count,
                        id: \.self
                    ) { index in
                        let radius = -baseRadius - spacing * CGFloat(index + 1)
                        let goal = learnerStore.getGoalFromID(
                            learnerStore
                                .getGoalsFromLearner(
                                    $learner,
                                    planet: planet!
                                )[index]
                        )

                        VStack {
                            Image(.goal)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .onTapGesture {
                                    selectedGoalID = goal.id
                                    isShowingDetail = true
                                }
                            Text(goal.title)
                                .frame(width: 200)
                        }
                        .offset(
                            y: radius
                        )
                    }
                }
                .offset(
                    x: 0, y: geometry.size.height - geometry.size.width / 2
                )
            }
        }
        .navigationTitle(planet?.rawValue ?? "Empty")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                }
            }
            if learner.id == learnerStore.mainLearner.id {
                ToolbarItem {
                    Button {
                        isShowingAdding = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $isShowingDetail) {
            GoalDetailView(learnerStore: learnerStore, goalID: selectedGoalID)
        }
        .alert(
            "나만의 \(planet?.rawValue ?? "Empty") 목표 추가",
            isPresented: $isShowingAdding,
            actions: {
                TextField("", text: $title)

                Button(
                    "추가",
                    action: {
                        learnerStore
                            .addGoal(
                                learner: $learner,
                                goal: Goal(
                                    planet: planet!,
                                    title: title,
                                    description: "",
                                    creater_id: learner.id,
                                    star_count: 0,
                                    share_count: 0,
                                    comment_count: 0
                                )
                            )
                    }
                )
                Button("취소", role: .cancel, action: {})
            },
            message: {
                Text("당신을 한층 더 성장시킬 수 있는 목표를 추가해 보세요")
            }
        )
    }
}

#Preview {
    @ObservedObject var learnerStore = LearnerStore()

    learnerStore
        .addGoal(
            learner: $learnerStore.mainLearner,
            goal: Goal(
                planet: .Tech,
                title: "Test",
                description: "",
                creater_id: UUID(),
                star_count: 0,
                share_count: 0,
                comment_count: 0
            )
        )

    return PlanetDetailView(
        learnerStore: learnerStore,
        learner: $learnerStore.mainLearner,
        planet: .Tech
    )
}
