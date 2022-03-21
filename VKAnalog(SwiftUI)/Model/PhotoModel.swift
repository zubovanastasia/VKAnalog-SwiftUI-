//
//  PhotoModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import Foundation
import SwiftUI

// MARK: - Photo
struct Photos: Codable {
    let response: PhotoResponse
}

// MARK: - Response
struct PhotoResponse: Codable {
    let count: Int
    let items: [PhotoModel]?
}

// MARK: - Item
struct PhotoModel: Codable, Identifiable {
    var albumID: Int
    var reposts: Reposts
    var postID, id, date: Int
    var text: String
    var sizes: [Size]?
    var hasTags: Bool
    var ownerID: Int
    var likes: Likes
    var photoAvailable: Size? {
        
        guard let sizes = self.sizes else { return nil }
        if let photo = sizes.first(where: {$0.type == "x"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "z"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "y"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "m"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "s"}) { return photo }
        
        return sizes.first
    }
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case reposts
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case likes
    }
}

// MARK: - Size
struct Size: Codable {
    let width: CGFloat
    let height: CGFloat
    let url: String
    let type: String
}

// MARK: - Likes
struct Likes: Codable {
    var userLikes, count: Int
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
// MARK: - Reposts
struct Reposts: Codable {
    var count: Int
}
