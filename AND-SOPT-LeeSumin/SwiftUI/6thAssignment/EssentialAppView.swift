//
//  EssentialAppView.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/29/24.
//

import SwiftUI

// MARK: - Models
struct AppItem: Identifiable {
    let id = UUID()
    let iconName: String
    let appName: String
    let description: String
    let buttonType: AppButtonType
}

enum AppButtonType {
    case download
    case update
    case get
}

// MARK: - Views
struct AppListView: View {
    let apps: [AppItem] = [
        .init(iconName: "appIcon",
              appName: "TVING",
              description: "즐거움을 스트리밍하세요",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "네이버 웹툰 - Naver Webtoon",
              description: "엔터테인먼트",
              buttonType: .update),
        .init(iconName: "appIcon",
              appName: "카카오웹툰 - KAKAO WEBTOON",
              description: "끝없는 이야기",
              buttonType: .get),
        .init(iconName: "appIcon",
              appName: "TikTok 틱톡",
              description: "15초만에 사로잡는 재미있는 영상이 가득한 틱톡!",
              buttonType: .get),
        .init(iconName: "appIcon",
              appName: "당근",
              description: "당신 근처의 지역 생활 커뮤니티",
              buttonType: .get),
        .init(iconName: "appIcon",
              appName: "카카오맵 - 대한민국 No.1 지도앱",
              description: "좋은 곳으로 이끌어 줄 지도",
              buttonType: .update),
        .init(iconName: "appIcon",
              appName: "TVING",
              description: "즐거움을 스트리밍하세요",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "네이버 웹툰 - Naver Webtoon",
              description: "엔터테인먼트",
              buttonType: .update),
        .init(iconName: "appIcon",
              appName: "카카오웹툰 - KAKAO WEBTOON",
              description: "끝없는 이야기",
              buttonType: .get),
        .init(iconName: "appIcon",
              appName: "TikTok 틱톡",
              description: "15초만에 사로잡는 재미있는 영상이 가득한 틱톡!",
              buttonType: .get),
        .init(iconName: "appIcon",
              appName: "당근",
              description: "당신 근처의 지역 생활 커뮤니티",
              buttonType: .get)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(apps) { app in
                        AppItemView(item: app)
                    }
                }
                .padding()
            }
            .navigationTitle("iPhone 필수 앱")
        }
    }
}

struct AppItemView: View {
    let item: AppItem
    
    var body: some View {
        HStack(spacing: 12) {
            appIcon
            appInfo
            Spacer()
            AppButton(type: item.buttonType)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var appIcon: some View {
        Image(item.iconName)
            .resizable()
            .frame(width: 60, height: 60)
            .cornerRadius(12)
    }
    
    private var appInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.appName)
                .font(.system(size: 16, weight: .regular))
            Text(item.description)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
    }
}

struct AppButton: View {
    let type: AppButtonType
    
    var body: some View {
        Group {
            switch type {
            case .download:
                downloadButton
            case .update:
                textButton("업데이트")
            case .get:
                textButton("받기")
            }
        }
    }
    
    private var downloadButton: some View {
        Image(systemName: "icloud.and.arrow.down")
            .modifier(ButtonModifier())
    }
    
    private func textButton(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 14, weight: .bold))
            .padding(.horizontal, 16)
            .modifier(ButtonModifier())
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 6)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    AppListView()
}
