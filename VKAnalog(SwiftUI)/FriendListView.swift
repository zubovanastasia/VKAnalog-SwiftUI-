//
//  FriendListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI

struct FriendListView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .darkGray
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    var body: some View {
        
        NavigationView {
            ChildFriendListView()
                .navigationBarTitle(Text("Friends"))
        }
    }
}

struct ChildFriendListView: View {
    var body: some View {
        ZStack{
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                
                HStack{
                    UserAvatar {
                        Image("Avatar")
                    }
                    TextUserNameBuilder {
                        Text("Name")
                    }
                }
                .listRowBackground(Color.clear)
                
            }.background(Color(uiColor: .darkGray))
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
