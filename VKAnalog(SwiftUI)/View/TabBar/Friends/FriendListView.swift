//
//  FriendListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI
import Kingfisher

struct FriendListView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    @ObservedObject var viewModel: FriendViewModel
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .gray
    }
    
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
                    ForEach((viewModel.friends.filter({ "\(String(describing: $0.firstName))".contains(searchText) || searchText.isEmpty}))) { friend in
                        
                        NavigationLink(destination: PhotoGalleryView(viewModel: PhotoViewModel(photoService: PhotoAPI()), friend: friend)) {
                            
                            FriendCell(friends: friend)
                        }
                        .onAppear {viewModel.fetchFriends()}
                        .listRowBackground(Color.init(uiColor: .gray))
                        .navigationBarTitle(Text("Friends"), displayMode: .large)
                    }
                    .listStyle(.grouped)
                }
            }
        }
    }
}
