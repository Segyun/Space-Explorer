//
//  Blur.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?

    func makeUIView(context _: UIViewRepresentableContext<Self>)
        -> UIVisualEffectView
    {
        UIVisualEffectView()
    }

    func updateUIView(
        _ uiView: UIVisualEffectView,
        context _: UIViewRepresentableContext<Self>
    ) {
        uiView.effect = effect
    }
}
