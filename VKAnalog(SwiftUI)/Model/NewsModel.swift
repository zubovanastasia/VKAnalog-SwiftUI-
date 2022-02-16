//
//  NewsModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 16.02.2022.
//

import SwiftUI

class NewsModel: Identifiable {
    
    internal init(imageAvatar: String, name: String, textPost: String, imagePost: String) {
        self.imageAvatar = imageAvatar
        self.name = name
        self.textPost = textPost
        self.imagePost = imagePost
    }
    
    let id: UUID = UUID()
    let name: String
    let imageAvatar: String
    let textPost: String
    let imagePost: String
}

