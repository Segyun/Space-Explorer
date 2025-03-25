//
//  OnboardingPage.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct OnboardingPage: View {
    let namespace: Namespace.ID
    @Binding var isShowingOnboarding: Bool

    var body: some View {
        VStack {
            VStack {
                Text("목표를 만들고 찾고 공유해보세요.")
                    .font(.title)
                    .bold()
                Text("계속하시려면 닉네임을 입력해주세요.")
                Image(.earth)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "Earth", in: namespace)
                    .frame(width: 150)
                    .padding(.vertical, 50)
                TextField("닉네임을 입력하세요.", text: .constant(""))
                    .multilineTextAlignment(.center)
            }
            .frame(maxHeight: .infinity)

            Button {
                withAnimation {
                    isShowingOnboarding = false
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
}

#Preview {
    @Previewable @Namespace var namespace
    OnboardingPage(
        namespace: namespace,
        isShowingOnboarding: .constant(false)
    )
}
