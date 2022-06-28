//
//  AppPreviewRow.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct AppPreviewRow: View {
    @EnvironmentObject var rankState: AppData
    var rank: CGFloat?
    var isRankList: Bool?

    var body: some View {
        // 작은 크기 재활용 가능하게 리팩토링 필요
        HStack {
            ProfileImageView(size: 77)
                HStack {
                    if rankState.inRankList {
                        VStack {
                            Text("1")
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Title")
                            .font(.system(size: 20, weight: .semibold))
                        Text("SubTitle")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                    }

                }
                .padding(.bottom, 2)
                Spacer()
                Button("Get") {
                    print("Download pressed!")
                }
                .font(.system(size: 15, weight: .semibold))
//                .padding()
                .frame(width: 60, height: 27)
                .background(Color.yellow)
                .clipShape(Capsule())
        }
        .padding(.horizontal, 20)
        .frame(width: Constants.screenWidth)
        .background(Color.red)
    }
}

struct AppPreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        AppPreviewRow(rank: 1, isRankList: true)
    }
}
