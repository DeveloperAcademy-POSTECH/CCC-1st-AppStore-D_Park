//
//  TabTitleView.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct TabTitleView: View {
    var body: some View {
        HStack {
            Text("Title")
                .font(.system(size: 32, weight: .semibold))
            Spacer()
            AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(Circle())
            .frame(width: 50, height: 50)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 19))
    }
}

struct TabTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TabTitleView()
    }
}
