//
//  PhotoFriendCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct PhotoFriendCell: View {
    var photo: PhotoModel
    
    var body: some View {
        ZStack {
            HStack{
                KFImage(URL(string: photo.photoAvailable!.url)!)
                    .resizable()
                    .frame(width: photo.photoAvailable!.width / 2, height: photo.photoAvailable!.height / 2)
                    .aspectRatio(1, contentMode: .fill)
                
                Spacer().frame(height: 50.0)
            }
            HStack{
                LikeButtonCell()
                
                Spacer()
            }.padding()
        }
    }
}
