//
//  TodayMainCardView.swift
//  AppStoreClone
//
//  Created by JungHoonPark on 2022/06/28.
//

import SwiftUI

struct TodayMainCardView: View {
    @State var isExpand = false
    @State var activeId = UUID()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Tuesday, JUN 3")
                    .foregroundStyle(Color(UIColor.systemGray))
                HStack {
                    Text("Today")
                        .font(.system(.title))
                        .fontWeight(.semibold)
                    Spacer()
                    ProfileImageView(size: 35, radius: 35)
                }
            }.padding()
            
            VStack(spacing: 30) {
                ForEach(items) {item in
                    GeometryReader { reader in
                        ExpandView(isExpand: self.$isExpand, activeId: self.$activeId, data: item)
                            .offset(y: self.activeId == item.id ? reader.frame(in: .global).minY : 0)
                            .opacity(self.activeId != item.id && self.isExpand ? 0 : 1)
                    }
                    .frame(height: Constants.screenHeight * 0.45)
                    .frame(maxWidth: self.isExpand ? Constants.screenWidth : Constants.screenWidth * 0.9)
                }
            }
        }
    }
    
    @State var items = [
        Item(title: "abc", subTitle: "ab", image: "img1", content: "asdf"),
        Item(title: "def", subTitle: "ac", image: "img2", content: "sdf"),
        Item(title: "ghi", subTitle: "ad", image: "img3", content: "qwer")]
}

struct TodayMainCardView_Previews: PreviewProvider {
    static var previews: some View {
        TodayMainCardView()
    }
}

struct ExpandView: View {
    @State var dragValue = CGSize.zero
    
    @Binding var isExpand: Bool
    @Binding var activeId: UUID
    
    var data: Item
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(data.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .onTapGesture {
                    self.isExpand.toggle()
                    self.activeId = self.data.id
                }
                .opacity(self.activeId == data.id ? 0: 1)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(data.subTitle)
                        .foregroundColor(Color(UIColor.systemGray))
                        .fontWeight(.semibold)
                    
                    Text(data.title)
                        .font(.system(.title))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding()
                .opacity(self.activeId == data.id ? 0: 1)
            
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        Image(data.image)
                            .resizable()
                            .frame(maxHeight: Constants.screenHeight * 0.45)
                        
                        Text(data.content)
                            .foregroundColor(.black)
                            .padding()
                    }.padding(.bottom)
                }.edgesIgnoringSafeArea(.all)
                
                // 닫기
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isExpand = false
                            self.activeId = UUID()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.white.opacity(0.2))
                        }.frame(width: 30, height: 30)
                            .background(
                                Circle().foregroundColor(Color.white.opacity(0.6)))
                    }.padding(.top, 30)
                    
                    Spacer()
                }.padding()
            }.opacity(self.activeId == data.id ? 1: 0)
//                .gesture(
//                    self.activeId == data.id ?
//                    DragGesture().onChanged(value in
//                                            guard value.translation.height < 200 else {return}
//                                            if value.translation.height > 400 {
//                                                self.isExpand = false
//                                                self.activeId = UUID()
//                                                self.dragValue = .zero
//                                            } else {
//                                                self.dragValue = Value.transition
//                                            }
//                                           )
//                )
        }
        .frame(height: self.activeId == self.data.id ? Constants.screenHeight : Constants.screenHeight * 0.45)
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}
