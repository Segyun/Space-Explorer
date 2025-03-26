//
//  Learner.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import Foundation

struct Learner: Identifiable {
    var id = UUID()
    var name: String
    var goals: [UUID] = []
}
