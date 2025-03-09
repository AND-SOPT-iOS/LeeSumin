//
//  GridView.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/30/24.
//

import SwiftUI

struct PaymentItem: Identifiable {
    let id = UUID()
    let iconName: String
    let firstDescription: String
    let secondDescription: String
}

struct PaymentView: View {
    let payments : [PaymentItem] = [
        .init(iconName: "appIcon",
              firstDescription: "결제부터",
              secondDescription: "N빵하기"),
        .init(iconName: "appIcon",
              firstDescription: "결제부터",
              secondDescription: "N빵하기")
    ]
    
    let paymentRows = [GridItem(.fixed(30)),
                GridItem(.fixed(30)),
                GridItem(.fixed(30))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: paymentRows) {
                ForEach(payments) { payment in
                    Image(payment.iconName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                    Text(payment.firstDescription)
                    Text(payment.secondDescription)
                }
            }
        }
    }
}

#Preview {
    PaymentView()
}
