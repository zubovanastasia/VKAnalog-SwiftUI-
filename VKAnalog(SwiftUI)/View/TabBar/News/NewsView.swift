//
//  NewsListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI
import Kingfisher

struct NewsListView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .gray
    }
    
    @State private var news: [NewsModel] = [
        NewsModel(imageAvatar: "111", name: "User", textPost: "Hello, user!", imagePost: "111"),
        NewsModel(imageAvatar: "111", name: "User", textPost: "Hello, user!", imagePost: "111"),
        NewsModel(imageAvatar: "111", name: "User", textPost: "Hello, user!", imagePost: "111"),
        NewsModel(imageAvatar: "111", name: "User", textPost: "Hello, user!", imagePost: "111")
    ]
    
    var body: some View {
        
        ZStack{
            
            List {
                ForEach (news.sorted(by: { $0.name < $1.name })) { new in
                    NewsCell(new: new)
                    
                        .listRowBackground(Color.init(uiColor: .gray))
                        .navigationBarTitle(Text("News"), displayMode: .inline)
                }
                .listStyle(.grouped)
            }
        }
    }
}
