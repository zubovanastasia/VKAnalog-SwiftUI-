//
//  LikeButtonCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.03.2022.
//

import Foundation
import SwiftUI

struct LikeButtonCell: View {
    
    @State private var isLiked = false
    @State private var likesCount: Int = Int.random(in: 1...999)
    
    var body: some View {
        
        HStack {
            
            ZStack {
                Image(systemName: "heart.fill")
                    .opacity(isLiked ? 1 : 0)
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.15), value: isLiked)
                Image(systemName: "heart")
            }.foregroundColor(isLiked ? .red : .white)
            
            Text("\(likesCount)")
                .transition(.opacity.animation(.easeInOut(duration: 0.35)))
                .id(UUID())
        }
        .font(.system(size: 30))
        .onTapGesture {
            isLiked.toggle()
            likesCount += isLiked ? 1 : -1
        }
    }
}
