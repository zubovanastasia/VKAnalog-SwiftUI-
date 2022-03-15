//
//  PhotoGalleryView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI
import QGrid

struct PhotoGalleryView: View {
    
    let friend: FriendsModel
    
    @State private var photos: [PhotoModel] = [
        PhotoModel(imageName: "111"),
        PhotoModel(imageName: "111"),
        PhotoModel(imageName: "111"),
        PhotoModel(imageName: "111")
    ]
    
    var body: some View {
            
            ZStack {
                
                QGrid(photos, columns: 3) {
                    PhotoFriendCell(photo: $0)
                    
                }
            }
            .navigationBarTitle(Text("Photos \(friend.firstName) \(friend.lastName)"), displayMode: .inline)
            .background(Color.init(uiColor: .gray))
        }
    }
