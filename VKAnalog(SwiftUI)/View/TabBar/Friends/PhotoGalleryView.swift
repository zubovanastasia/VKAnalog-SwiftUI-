//
//  PhotoGalleryView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI
import QGrid

struct PhotoGalleryView: View {
    
    let friend: FriendModel
    
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
            .navigationBarTitle(Text("Photos \(friend.name)"), displayMode: .inline)
            .background(Color.init(uiColor: .gray))
        }
    }

struct PhotoFriendCell: View {
    
    let photo: PhotoModel
    
    var body: some View {
        
        ZStack {
            
            HStack{
                Image(photo.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
    }
}
