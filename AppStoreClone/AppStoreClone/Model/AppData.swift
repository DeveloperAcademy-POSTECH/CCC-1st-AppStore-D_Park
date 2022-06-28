//
//  Rank.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/28.
//

import Foundation
import Combine
import SwiftUI

class AppData: ObservableObject {
    @Published var inRankList = false
}

// Item for data
struct Item: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var image: String
    var content: String
}
