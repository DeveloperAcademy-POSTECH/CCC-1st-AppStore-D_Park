//
//  ProfileImageView.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct ProfileImageView: View {
    var size: CGFloat
    var radius: CGFloat?

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: radius ?? 10))
            .frame(width: size, height: size)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(size: 77)
    }
}
