//
//  Untitled.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/1/24.
//

import UIKit

enum AppStoreSectionType: Int, CaseIterable {
    case featured
    case categories
}

enum CategoryItemType {
    case header(title: String, subtitle: String)
    case app(AppItem)
}

struct AppItem: Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: UIImage
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
