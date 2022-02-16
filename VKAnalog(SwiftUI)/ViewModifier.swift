//
//  ViewModifier.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.clear, lineWidth: 0))
            .shadow(color: shadowColor, radius: shadowRadius)
    }
}

struct TextUserNameModifier: ViewModifier {
    let size: CGFloat
    let style: Font.Weight
    let design: Font.Design
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: style, design: design))
    }
}
