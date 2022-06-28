//
//  AppPreviewList.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/28.
//

import SwiftUI

struct AppPreviewList: View {
    var body: some View {
        VStack {
            AppPreviewRow()
            AppPreviewRow()
            AppPreviewRow()
        }
    }
}

struct AppPreviewList_Previews: PreviewProvider {
    static var previews: some View {
        AppPreviewList()
    }
}
