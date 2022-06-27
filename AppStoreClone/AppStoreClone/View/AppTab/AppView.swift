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
