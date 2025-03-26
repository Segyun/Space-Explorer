//
//  OnboardingPage.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct OnboardingPage: View {
    @Binding var isShowingOnboarding: Bool
    @Binding var nickname: String
    @State private var isAlertShowing = false

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
            VStack {
                VStack(alignment: .leading) {
                    Text("Universe of Academy")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 20)
                    Text("목표를 연결하고 가능성을 확장하세요")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    Text("러너의 아름다운 우주를 탐험하고\n당신의 특별한 우주를 꾸미는데에 영감을 얻으세요")
                    VStack {
                        Color.clear
                        Image(.earth)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    .frame(height: 150)
                    .padding(.vertical, 50)
                    TextField("닉네임을 입력하세요.", text: $nickname)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .frame(maxHeight: .infinity)

                Button {
                    if nickname == "" {
                        isAlertShowing = true
                    } else {
                        withAnimation {
                            isShowingOnboarding = false
                        }
                    }
                } label: {
                    Text("시작하기")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .alert("닉네임을 입력해주세요", isPresented: $isAlertShowing, actions: {
            Button("확인") {}
        })
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingPage(
        isShowingOnboarding: .constant(false),
        nickname: .constant("")
    )
}
