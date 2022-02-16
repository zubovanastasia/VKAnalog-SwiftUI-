//
//  FriendModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI

class FriendModel: Identifiable {
    
    internal init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    let id: UUID = UUID()
    let name: String
    let imageName: String
}
