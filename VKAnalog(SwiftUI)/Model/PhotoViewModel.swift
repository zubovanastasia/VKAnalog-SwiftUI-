//
//  PhotoViewModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 21.03.2022.
//

import SwiftUI

 class PhotoViewModel: ObservableObject {
     @Published var photos: [PhotoModel] = []
     let photoService: PhotoService
     var friendID: String = ""
     init(photoService: PhotoService) {
         self.photoService = photoService
     }

     public func fetchPhoto(friendID: String) {
         photoService.getPhoto(friendID: friendID) { [weak self] photo in
             guard let self = self else { return }
             self.photos = photo ?? []
         }
     }
 }
