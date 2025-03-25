//
//  ExploreView.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                ForEach(0 ..< 25, id: \.self) { _ in
                    VStack {
                        Image(.earth)
                            .resizable()
                            .scaledToFit()
                        Text("Lemon")
                    }
                }
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    ExploreView()
}
