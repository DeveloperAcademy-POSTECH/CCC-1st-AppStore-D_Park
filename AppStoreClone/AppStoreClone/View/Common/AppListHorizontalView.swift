//
//  AppListHorizontalView.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/28.
//

import SwiftUI

struct AppListHorizontalView: View {
    var title: String

    var body: some View {
        Section {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<4) { _ in
                            AppPreviewList()
                        }
                    }
                }
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
            } .frame(width: Constants.screenWidth, alignment: .center)
        }
    header: {
        Divider()
        HStack {
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            Button("See All") {}
            }
        }
        padding()
    }
}

struct AppListHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        AppListHorizontalView(title: "인기앱")
    }
}
