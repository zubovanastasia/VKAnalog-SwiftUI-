//
//  ImageKingfisher.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 01.03.2022.
//

import SwiftUI
import Kingfisher

struct ImageKingfisher: View {
    var friend: FriendsModel
    var body: some View {
        VStack {
            UserAvatar { KFImage(URL(string: friend.photo100!)!) }
        }
    }
}
