//
//  NewsListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI

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


struct NewsCell: View {
    
    let new: NewsModel
    
    var body: some View {
        
        ZStack {
            
            VStack{
                HStack{
                    UserAvatar {
                        Image(new.imageAvatar)
                    }
                    Text(new.name)
                        .modifier(TextUserNameModifier(size: 13, style: .regular, design: .default))
                    Spacer()
                }
                HStack{
                    Text(new.textPost)
                    Spacer()
                }
                HStack{
                    
                    Image(new.imagePost)
                        .frame(width: 300, height: 300, alignment: .center)
                }
                Spacer()
            }
            .padding()
            
            Spacer()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
