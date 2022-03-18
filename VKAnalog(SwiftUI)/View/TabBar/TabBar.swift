//
//  TabBar.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        TabView {
            
            NewsListView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("News")
                }
            
            FriendListView(viewModel: FriendViewModel(friendsService: FriendsAPI()))
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
            
            GroupListView(viewModel: GroupViewModel(groupService: GroupsAPI()))
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Groups")
                }
        }
        .accentColor(.white)
    }
}
