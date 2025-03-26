//
//  GoalDetailView.swift
//  Space Explorer
//
//  Created by PenguinLand on 3/26/25.
//

import SwiftUI

struct GoalDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var learnerStore: LearnerStore
    var goalID: UUID

    var body: some View {
        let goal = learnerStore.goals.first(
            where: { $0.id == goalID
            }) ?? Goal.emtpyGoal
        
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Goal")
                        .font(.title)
                        .bold()
                    Spacer()
                    HStack {
                        if learnerStore
                            .hasLearnerGoal(
                                learner: learnerStore.mainLearner,
                                goal: goal
                            ) {
                            Button {
                                learnerStore
                                    .removeGoal(
                                        learner: $learnerStore.mainLearner,
                                        goal: goal
                                    )
                            } label: {
                                Image(systemName: "trash")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color(uiColor: .label))
                                    .background(Color(uiColor: .red))
                                    .clipShape(Circle())
                            }
                        } else {
                            Button {
                                learnerStore
                                    .addGoal(
                                        learner: $learnerStore.mainLearner,
                                        goal: goal
                                    )
                            } label: {
                                Image(systemName: "square.and.arrow.down")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color(uiColor: .label))
                                    .background(Color(uiColor: .systemBackground))
                                    .clipShape(Circle())
                            }
                        }
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(uiColor: .label))
                                .background(Color(uiColor: .systemBackground))
                                .clipShape(Circle())
                        }
                    }
                }

                Image(.goal)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 70)

                Text(goal.title)
                    .font(.title)
                    .bold()

                Text(learnerStore.getLearnerFromID(goal.creater_id).name)
                    .font(.headline)

                HStack(spacing: 35) {
                    HStack {
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                        Text("\(goal.star_count)")
                    }
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.green)
                        Text("\(goal.share_count)")
                    }
                    HStack {
                        Image(systemName: "ellipsis.message")
                            .foregroundStyle(.purple)
                        Text("\(goal.comment_count)")
                    }
                }
                .padding(.vertical)
                
                Text(
                    goal.description
                )
                .multilineTextAlignment(.center)

                Spacer()

                HStack {
                    Text("COMMENTS (\(goal.comment_count))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Alex")
                            .font(.headline)
                        Text("저도 참여해야겠어요~!!")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    HStack {
                        Text("More")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.secondary)
                }
                .padding()
                .background(Color(uiColor: .systemBackground),
                            in: RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
        .preferredColorScheme(.dark)
        .presentationBackground(.clear)
    }
}

#Preview {
    @ObservedObject var learnerStore = LearnerStore()
    var goal = Goal(
        planet: .Tech,
        title: "title",
        description: "description",
        creater_id: learnerStore.mainLearner.id,
        star_count: 0,
        share_count: 0,
        comment_count: 0
    )
    
    learnerStore
        .addGoal(
            learner: $learnerStore.mainLearner,
            goal: goal
        )
    
    return GoalDetailView(
        learnerStore: LearnerStore(), goalID: goal.id
    )
}
