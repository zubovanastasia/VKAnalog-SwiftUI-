//
//  PhotoGalleryView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI
import QGrid
import Kingfisher

struct PhotoGalleryView: View {
    @ObservedObject var viewModel: PhotoViewModel
    let friend: FriendsModel
    
    let columns = [
        GridItem(.flexible(minimum: 50), spacing: 2),
        GridItem(.flexible(minimum: 50), spacing: 2),
        GridItem(.flexible(minimum: 50), spacing: 2)
    ]
    
    init(viewModel: PhotoViewModel, friend: FriendsModel) {
        self.viewModel = viewModel
        self.friend = friend
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(viewModel.photos) { photo in
                    GeometryReader { geometry in
                        NavigationLink(destination: PhotoFriendCell(photo: photo)) {
                            KFImage(URL(string: photo.photoAvailable!.url)!)
                                .resizable()
                                .scaledToFill()
                                .frame(height: geometry.size.width)
                        }
                    }
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
                    .navigationBarTitle(Text("Photos \(friend.firstName) \(friend.lastName)"), displayMode: .inline)
                    .background(Color.init(uiColor: .gray))
                }
            }
        }.onAppear { viewModel.fetchPhoto(friendID: String(friend.id)) }
    }
}
