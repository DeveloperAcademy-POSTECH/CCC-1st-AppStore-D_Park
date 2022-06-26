//
//  AppPreviewRow.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/27.
//

import SwiftUI

struct AppPreviewRow: View {
    var body: some View {
        //작은 크기 재활용 가능하게 리팩토링 필요
        HStack {
            AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 77, height: 77)
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.system(size: 20, weight: .semibold))
                    Text("SubTitle")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 2)
                Spacer()
                Button("Get") {
                    print("Download pressed!")
                }
                .padding()
                .frame(width: 60, height: 27)
                .background(Color.yellow)
                .clipShape(Capsule())
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 19))
    }
}

struct AppPreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        AppPreviewRow()
    }
}
