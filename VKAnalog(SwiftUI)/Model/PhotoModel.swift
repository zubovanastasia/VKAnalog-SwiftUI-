//
//  PhotoModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI

class PhotoModel: Identifiable {
    
    internal init(imageName: String) {
        self.imageName = imageName
    }
    
    let id: UUID = UUID()
    let imageName: String
}
