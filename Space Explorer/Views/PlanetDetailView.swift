//
//  PlanetDetailView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct PlanetDetailView: View {
    let namespace: Namespace.ID
    var planet: Planet?

    let baseRadius: CGFloat = 100
    let spacing: CGFloat = 100

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(planet?.image ?? .goal)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: Planet.Business, in: namespace)

                ForEach(0 ..< 5, id: \.self) { index in
                    let radius = -baseRadius - spacing * CGFloat(index + 1)
                    Image(.goal)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 150)
                        .offset(
                            x: CGFloat.random(in: -100...100),
                            y: radius
                        )
                }
            }
            .offset(
                x: 0, y: geometry.size.height - geometry.size.width / 2
            )
        }
    }
}

#Preview {
    @Previewable @Namespace var namespace
    PlanetDetailView(namespace: namespace, planet: .Tech)
}
