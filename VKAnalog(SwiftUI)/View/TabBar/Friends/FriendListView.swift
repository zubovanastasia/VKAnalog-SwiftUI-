//
//  FriendListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI

struct FriendListView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .gray
    }
    
    @State var searchText = ""
    @State var isSearching = false
    
    @State private var friends: [FriendModel] = [
        FriendModel(name: "Ivan", imageName: "111"),
        FriendModel(name: "Vasiliy", imageName: "111"),
        FriendModel(name: "Marina", imageName: "111"),
        FriendModel(name: "Nataliya", imageName: "111")
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.init(uiColor: .gray))
            VStack{
                HStack{
                    HStack{
                        TextField("Search...", text: $searchText)
                        .padding(.leading, 22)}
                    .padding()
                    .background(Color(uiColor: .lightGray))
                    //.frame(width: 280, height: 40, alignment: .center)
                    .frame(height: 40)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            
                            if isSearching {
                                Button(action: { searchText = "" }, label: { Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                                
                            }
                            
                        }.padding(.horizontal, 30)
                            .foregroundColor(.gray)
                        
                    )
                    .transition(.move(edge: .trailing))
                    .animation(.spring(), value: searchText)
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(Color.init(uiColor: .lightGray))
                                .padding(.trailing)
                                .padding(.leading, -19)
                        })
                    }
                }
                
                List {
                    ForEach(friends.filter({ "\($0.name)".contains(searchText) || searchText.isEmpty})) { friend in
                        
                        NavigationLink(destination: PhotoGalleryView(friend: friend)) {
                            
                            FriendCell(friend: friend)
                        }
                        .listRowBackground(Color.init(uiColor: .gray))
                        .navigationBarTitle(Text("Friends"), displayMode: .large)
                    }
                    .listStyle(.grouped)
                }
            }
        }
    }
}

struct FriendCell: View {
    
    let friend: FriendModel
    
    var body: some View {
        
        ZStack {
            
            HStack{
                UserAvatar {
                    Image(friend.imageName)
                }
                
                TextUserNameBuilder {
                    Text(friend.name)
                }
            }.padding()
            
            Spacer()
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}

