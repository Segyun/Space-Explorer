//
//  LearnerStore.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import SwiftUI

class LearnerStore: ObservableObject {
    // MARK: Lifecycle

    init() {
        var alex = Learner(name: "Alex")
        var jack = Learner(name: "Jack")
        var skyler = Learner(name: "Skyler")
        var luka = Learner(name: "Luka")

        let goals: [Goal] = [
            // Jack's Goals

            Goal(
                planet: .Design,
                title: "UX/UI 관련 책 읽기",
                description:
                    "UX/UI 디자인을 더 깊이 이해하기 위해 다양한 서적을 읽고 실무 적용 방안을 연구하기.",
                creater_id: jack.id, star_count: 10, share_count: 4,
                comment_count: 3),

            Goal(
                planet: .Design,
                title: "피그마 공부하기",
                description: "Figma의 주요 기능과 디자인 시스템을 학습하고 프로젝트에 적용해보기.",
                creater_id: jack.id, star_count: 12, share_count: 5,
                comment_count: 4),

            Goal(
                planet: .Design, title: "노션 UI 분석하기",

                description: "Notion의 UX/UI 디자인을 분석하여 우수한 디자인 패턴을 벤치마킹하기.",

                creater_id: jack.id, star_count: 8, share_count: 3,
                comment_count: 2),

            Goal(
                planet: .Tech, title: "스스챌 위너",

                description: "스스로 챌린지(스스챌)에서 우승할 수 있도록 개인 프로젝트 완성도 높이기.",

                creater_id: jack.id, star_count: 14, share_count: 6,
                comment_count: 5),

            Goal(
                planet: .Tech, title: "RX Swift",

                description: "RxSwift를 활용하여 반응형 프로그래밍 개념을 익히고 실습 프로젝트 진행하기.",

                creater_id: jack.id, star_count: 11, share_count: 4,
                comment_count: 3),

            Goal(
                planet: .Tech, title: "Check-ing 클론 코딩",

                description: "체크잉(Check-ing) 앱의 UI/UX를 클론 코딩하여 실무 스킬을 향상시키기.",

                creater_id: jack.id, star_count: 13, share_count: 7,
                comment_count: 5),

            Goal(
                planet: .Business, title: "CBL 마스터하기",

                description:
                    "CBL(Challenge Based Learning) 학습 방식에 대한 이해도를 높이고 실무 적용하기.",

                creater_id: jack.id, star_count: 9, share_count: 3,
                comment_count: 2),

            Goal(
                planet: .Business, title: "iOS 앱 출시하기",

                description:
                    "Swift 및 SwiftUI를 활용하여 완성도 높은 iOS 앱을 개발하고 앱스토어에 출시하기.",

                creater_id: jack.id, star_count: 15, share_count: 8,
                comment_count: 6),

            Goal(
                planet: .Business, title: "프로젝트 매니징 관련 책 읽기",

                description: "효율적인 프로젝트 관리를 위해 프로젝트 매니징 관련 도서를 읽고 정리하기.",

                creater_id: jack.id, star_count: 10, share_count: 4,
                comment_count: 3),

            // Alex's Goals

            Goal(
                planet: .Design, title: "디자인 시스템 인프런 강의 완강하기",

                description: "디자인 시스템 개념과 활용법을 배우기 위해 인프런 강의를 완강하기.",

                creater_id: alex.id, star_count: 9, share_count: 5,
                comment_count: 4),

            Goal(
                planet: .Design, title: "Google UX Design 강의 듣기",

                description: "Google이 제공하는 UX Design 과정을 수강하여 UX 설계 원칙을 학습하기.",

                creater_id: alex.id, star_count: 11, share_count: 6,
                comment_count: 7),

            Goal(
                planet: .Design, title: "다음 스스챌에 낼 개인 챌린지 진행하기",

                description: "다음 스스로 챌린지(스스챌)에 제출할 개인 프로젝트를 계획하고 개발하기.",

                creater_id: alex.id, star_count: 10, share_count: 4,
                comment_count: 3),

            Goal(
                planet: .Business, title: "러너들과 Vision 워크샵 진행하기",

                description: "팀 러너들과 함께 비전 워크샵을 기획하고 협업을 강화하는 시간 갖기.",

                creater_id: alex.id, star_count: 12, share_count: 5,
                comment_count: 4),

            Goal(
                planet: .Business, title: "앱 유료광고 수익 창출하기",

                description: "앱 광고를 최적화하여 유료 광고 수익을 창출하고 비즈니스 모델 개선하기.",

                creater_id: alex.id, star_count: 14, share_count: 7,
                comment_count: 5),

            Goal(
                planet: .Business, title: "예비창업패키지 통과하기",

                description: "예비창업패키지 지원서를 작성하고 심사를 통과하여 창업 지원금을 확보하기.",

                creater_id: alex.id, star_count: 13, share_count: 6,
                comment_count: 5),

            // Skyler's Goals

            Goal(
                planet: .Design, title: "기존 UI/UX 디자인 케이스 분석하기",

                description: "다양한 UI/UX 디자인 사례를 분석하고 우수한 디자인 원칙을 학습하기.",

                creater_id: skyler.id, star_count: 8, share_count: 4,
                comment_count: 3),

            Goal(
                planet: .Design, title: "피그마 단축키 외우기",

                description: "디자인 작업 속도를 향상시키기 위해 Figma의 단축키를 익히고 활용하기.",

                creater_id: skyler.id, star_count: 7, share_count: 3,
                comment_count: 2),

            Goal(
                planet: .Design, title: "디자인 시스템을 이용하여 미니 프로젝트 수행하기",

                description: "디자인 시스템을 활용하여 작은 프로젝트를 수행하고 실무 경험 쌓기.",

                creater_id: skyler.id, star_count: 9, share_count: 4,
                comment_count: 3),

            Goal(
                planet: .Tech, title: "CS 지식 정리하기",

                description: "컴퓨터 공학 기본 개념을 정리하고 실무에서 활용할 수 있도록 공부하기.",

                creater_id: skyler.id, star_count: 10, share_count: 5,
                comment_count: 4),

            Goal(
                planet: .Tech, title: "깃 사용법 익히기",

                description: "Git의 기본 개념과 협업 방식 익히기 (브랜치, 머지, 충돌 해결 등).",

                creater_id: skyler.id, star_count: 11, share_count: 6,
                comment_count: 4),

            // Luka's Goals

            Goal(
                planet: .Design, title: "디자인 설계에 관한 책 3권 읽기",

                description: "UI/UX 디자인 설계 원리를 깊이 이해하기 위해 관련 도서를 3권 선정하여 읽기.",

                creater_id: luka.id, star_count: 13, share_count: 5,
                comment_count: 6),

            Goal(
                planet: .Design, title: "UI/UX 디자인 방법론 특징, 장단점 조사하기",

                description: "다양한 UI/UX 디자인 방법론을 비교 분석하고 실무 적용 방안 연구하기.",

                creater_id: luka.id, star_count: 9, share_count: 3,
                comment_count: 2),

            Goal(
                planet: .Tech, title: "Github 잔디 챌린지 해보기",

                description: "매일 꾸준히 GitHub에 커밋하여 개발 습관을 형성하고 코드 관리 연습하기.",

                creater_id: luka.id, star_count: 14, share_count: 7,
                comment_count: 5),

            Goal(
                planet: .Tech, title: "인프런 스위프트 강의 완강",

                description: "Swift의 기초부터 고급 개념까지 학습할 수 있는 인프런 강의를 완강하기.",

                creater_id: luka.id, star_count: 12, share_count: 5,
                comment_count: 4),

            Goal(
                planet: .Design, title: "Figma로 Prototype 만들어보기",

                description: "Figma를 활용하여 실제 앱 프로토타입을 제작하고 사용자 테스트 진행하기.",

                creater_id: luka.id, star_count: 15, share_count: 8,
                comment_count: 6),
        ]

        for goal in goals {
            switch goal.creater_id {
            case alex.id:
                alex.goals.append(goal.id)
            case luka.id:
                luka.goals.append(goal.id)
            case skyler.id:
                skyler.goals.append(goal.id)
            case jack.id:
                jack.goals.append(goal.id)
            default:
                print("No id")
            }
        }

        addLearner(alex)
        addLearner(jack)
        addLearner(skyler)
        addLearner(luka)

        self.goals = goals
    }

    // MARK: Internal

    @Published var learners: [Learner] = []
    @Published var mainLearner: Learner = .init(name: "", goals: [])
    @Published var goals: [Goal] = []

    func addGoal(learner: Binding<Learner>, goal: Goal) {
        goals.append(goal)

        learner.wrappedValue.goals.append(goals.last!.id)
    }

    func removeGoal(learner: Binding<Learner>, goal: Goal) {
        learner.wrappedValue.goals.removeAll { $0 == goal.id }
    }

    func addLearner(_ learner: Learner) {
        learners.append(learner)
    }

    func getGoalsFromLearner(_ learner: Binding<Learner>, planet: Planet)
        -> [UUID]
    {
        learner.wrappedValue.goals.filter { id in
            goals.first(where: { goal in
                goal.id == id
            })!.planet == planet
        }
    }

    func getGoalFromID(_ id: UUID) -> Goal {
        guard
            let goal = goals.first(
                where: {
                    $0.id == id
                })
        else { return Goal.emtpyGoal }
        return goal
    }

    func getLearnerFromID(_ id: UUID) -> Learner {
        if id == mainLearner.id {
            return mainLearner
        }

        guard
            let learner = learners.first(
                where: {
                    $0.id == id
                })
        else { return Learner(name: "Empty", goals: []) }
        return learner
    }

    func getBindingLearner(_ learner: Learner) -> Binding<Learner> {
        Binding<Learner>(
            get: {
                guard
                    let index = self.learners.firstIndex(
                        where: {
                            $0.id
                                == learner
                                .id
                        })
                else { return Learner(name: "Empty") }
                return self.learners[index]
            },
            set: { newValue in
                guard
                    let index = self.learners.firstIndex(
                        where: {
                            $0.id
                                == learner
                                .id
                        })
                else { return }
                self.learners[index] = newValue
            })
    }

    func hasLearnerGoal(learner: Learner, goal: Goal) -> Bool {
        learner.goals.contains(goal.id)
    }
}
