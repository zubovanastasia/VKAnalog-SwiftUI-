//
//  FriendCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct FriendCell: View {
    
    var friends: FriendsModel
    
    var body: some View {
        
        ZStack {
            
            HStack{
                UserAvatar {
                    KFImage(URL(string: friends.photo100!)!)
                }
                
                TextUserNameBuilder {
                    Text("\(friends.firstName) \(friends.lastName)")
                }
            }.padding()
            
            Spacer()
        }
    }
}
