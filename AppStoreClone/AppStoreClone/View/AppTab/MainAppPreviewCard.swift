//
//  MainAppPreviewCard.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct MainAppPreviewCard: View {
    var category: String
    var title: String
    var subTitle: String

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(category)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.blue)
                    Text(title)
                        .font(.title)
                    Text(subTitle)
                        .font(.title2)
                }
                Spacer()
            }.padding(.horizontal, 20)
            AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: Constants.screenWidth - 60, height: 200)
            .cornerRadius(10)
        }

    }
}

struct MainAppPreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        MainAppPreviewCard(category: "건강한 삶", title: "사운드 짐", subTitle: "피트니스 커뮤니티")
    }
}
