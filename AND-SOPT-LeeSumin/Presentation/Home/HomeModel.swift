//  AppItem.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/1/24.
//

import UIKit

enum AppStoreSectionType: Int, CaseIterable {
    case featured
    case categories
}

struct AppItem: Hashable {
    enum ItemType {
        case header
        case app
    }
    
    let id = UUID()
    let type: ItemType
    let title: String
    let subtitle: String
    let image: UIImage?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension AppItem {
    static let dummyFeatured: [AppItem] = [
        AppItem(
            type: .app,
            title: "TVING",
            subtitle: "2024-2025 KCC 프로농구",
            image: UIImage(resource: .tving)
        ),
        AppItem(
            type: .app,
            title: "TVING",
            subtitle: "2024-2025 KCC 프로농구",
            image: UIImage(resource: .tving)
        ),
        AppItem(
            type: .app,
            title: "TVING",
            subtitle: "2024-2025 KCC 프로농구",
            image: UIImage(resource: .tving)
        )
    ]
    
    static let dummyCategories: [AppItem] = [
        AppItem(
            type: .header,
            title: "iPhone 필수 앱",
            subtitle: "에디터가 직접 고른 추천 앱으로 시작하세요",
            image: nil
        ),
        AppItem(
            type: .app,
            title: "데이트로드",
            subtitle: "커플들이 직접 공유하는 데이트 코스",
            image: UIImage(resource: .appIcon)
        ),
        AppItem(
            type: .app,
            title: "데이트로드",
            subtitle: "커플들이 직접 공유하는 데이트 코스",
            image: UIImage(resource: .appIcon)
        ),
        AppItem(
            type: .app,
            title: "데이트로드",
            subtitle: "커플들이 직접 공유하는 데이트 코스",
            image: UIImage(resource: .appIcon)
        )
    ]
}
