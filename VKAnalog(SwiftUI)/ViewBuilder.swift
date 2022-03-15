//
//  ViewBuilder.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI
import Kingfisher

struct UserAvatar: View {
    
    @State private var scaleFactor = 1.0
    
    var content: KFImage
    
    init(@ViewBuilder content: () -> KFImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 35, height: 35)
            .modifier(CircleShadow(shadowColor: .white, shadowRadius: 4))
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .scaleEffect(scaleFactor)
            .animation(.spring(response: 0.2, dampingFraction: 0.35, blendDuration: 0.25), value: scaleFactor)
            .onTouchGesture(
                touchBegan: { withAnimation { self.scaleFactor = 1.7 }},
                touchEnd: { _ in withAnimation { self.scaleFactor = 1.0 }}
            )
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
