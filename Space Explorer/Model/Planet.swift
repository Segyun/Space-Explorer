//
//  Planet.swift
//  Space Explorer
//
//  Created by 정희균 on 3/25/25.
//

import SwiftUI

enum Planet: String, Codable {
    case Design
    case Tech
    case Business

    var image: ImageResource {
        switch self {
        case .Design:
            return .design
        case .Tech:
            return .tech
        case .Business:
            return .business
        }
    }
}
