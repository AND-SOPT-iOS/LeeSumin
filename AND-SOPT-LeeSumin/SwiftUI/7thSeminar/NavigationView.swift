//
//  7thSeminar.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/30/24.
//

import SwiftUI

struct NavigationExampleView: View {
    enum Destination: Hashable {
        case detail
        case setting
        case profile

        var title: String {
            switch self {
            case .detail:
                "Go To Detail"
            case .setting:
                "Go To Setting"
            case .profile:
                "Go To Profile"
            }
        }
    }

    @State private var path = NavigationPath()
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                // 1. NavigationLink로 이동
                NavigationLink(Destination.detail.title, value: Destination.detail)

                // 2. 또는 버튼 / 액션으로 이동
                Button(Destination.detail.title) {
                    path.append(Destination.detail)
                }

                // 3. 여러 화면을 이동하는 경우
                Button("Go to Setting then Detail") {
                    path.append(Destination.setting)
                    path.append(Destination.detail)
                }
                
                Button("시트 띄우셈") {
                    isShowingSheet.toggle()
                }
                
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .detail:
                    DetailView(path: $path)
                case .setting:
                    Text("Setting View")
                case .profile:
                    Text("Profile View")
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                // 모달 닫힐 때 실행
                print("모달이 닫혔습니다")
            } content: {
                SwiftUIㅡㅐㅇView(isPresented: $isShowingSheet)
            }
        }
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath

    var body: some View {
        Button("Back To Root") {
            path.removeLast(2)
        }
    }
}

struct SwiftUIModalView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("모달 내용")
                
                Button("닫기") {
                    isPresented = false
                }
                .padding()
            }
            .navigationTitle("모달 화면")
            .navigationBarItems(trailing:
                Button("완료") {
                    isPresented = false
                }
            )
        }
    }
}

#Preview {
    NavigationExampleView()
}
