//
//  ViewBuilder.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI
import Kingfisher

struct UserAvatar: View {
    var content: KFImage
    
    init(@ViewBuilder content: () -> KFImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 35, height: 35)
            .modifier(CircleShadow(shadowColor: .white, shadowRadius: 4))
    }
}

struct TextUserNameBuilder: View {
    var content: Text
    
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View {
        content
            .foregroundColor(.black)
            .listRowBackground(Color.clear)
            .modifier(TextUserNameModifier(size: 17, style: .regular, design: .default))
    }
}
