//
//  PhotoFriendCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI

struct PhotoFriendCell: View {
    
    let photo: PhotoModel
    
    var body: some View {
        
        ZStack {
            
            HStack{
                Image(photo.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Spacer().frame(height: 50.0)
            }
            HStack{
                LikeButtonCell()
                
                Spacer()
                
            }.padding()
        }
    }
}
