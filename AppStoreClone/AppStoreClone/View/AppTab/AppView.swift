//
//  AppView.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        ScrollView {
            TabTitleView()
            Divider()
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<4) { _ in
                            MainAppPreviewCard(category: "건강한 삶", title: "건강해짐", subTitle: "건강")
                        }
                    }
                }.onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
            }
            .frame(width: Constants.screenWidth, alignment: .center)
            // 포함시키면 빌드가 안됨
            //            AppListHorizontalView(title: "인기앱")
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
