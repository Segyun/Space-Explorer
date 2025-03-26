//
//  Goal.swift
//  Space Explorer
//
//  Created by 정희균 on 3/26/25.
//

import Foundation

struct Goal: Identifiable {
    var id = UUID()
    var planet: Planet
    var title: String
    var description: String
    var creater_id: UUID
    var star_count: Int
    var share_count: Int
    var comment_count: Int
    
    static var emtpyGoal = Goal(
        planet: .Tech,
        title: "Title",
        description: "Description",
        creater_id: UUID(),
        star_count: 0,
        share_count: 0,
        comment_count: 0
    )
}
