//
//  SpaceView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

struct SpaceView: View {
    let namespace: Namespace.ID
    @State var selectedPlanet: Planet?

    var body: some View {
        if selectedPlanet != nil {
            PlanetDetailView(namespace: namespace, planet: selectedPlanet)
        } else {
            GeometryReader { geometry in
                ZStack {
                    Image(.earth)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "Earth", in: namespace)
                        .offset(x: 0, y: geometry.size.height - geometry.size.width / 2)
                    Image(.design)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .matchedGeometryEffect(
                            id: Planet.Design,
                            in: namespace
                        )
                        .offset(x: 25, y: -100)
                        .onTapGesture {
                            withAnimation {
                                selectedPlanet = .Design
                            }
                        }
                    Image(.tech)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .matchedGeometryEffect(
                            id: Planet.Tech,
                            in: namespace
                        )
                        .offset(x: -50, y: 50)
                        .onTapGesture {
                            withAnimation {
                                selectedPlanet = .Tech
                            }
                        }
                    Image(.business)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .matchedGeometryEffect(
                            id: Planet.Business,
                            in: namespace
                        )
                        .offset(x: 50, y: 200)
                        .onTapGesture {
                            withAnimation {
                                selectedPlanet = .Business
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @Namespace var namespace
    SpaceView(namespace: namespace)
}
