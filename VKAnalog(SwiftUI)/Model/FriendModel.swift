//
//  FriendModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI
import Foundation

class FriendViewModel: ObservableObject {
    
    @Published var friends: [FriendsModel] = []
    let friendsService: FriendService
    
    init(friendsService: FriendService) {
        self.friendsService = friendsService
    }
    
    public func fetchFriends() {
        friendsService.getFriends(){ [weak self] friends in
            guard let self = self else { return }
            self.friends = friends!.response.items
        }
    }
}
// MARK: - Friend
struct Friends: Codable {
    let response: FriendResponse
}

// MARK: - Response
struct FriendResponse: Codable {
    let count: Int
    let items: [FriendsModel]
}

// MARK: - Item
struct FriendsModel: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String?
    let online: Int?
    let sex: Int?
    let lastSeen: LastSeen?
    let trackCode: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo100 = "photo_100"
        case online, sex
        case lastSeen = "last_seen"
        case trackCode = "track_code"
    }
}

// MARK: - LastSeen
struct LastSeen: Codable {
    let platform: Int?
    let time: TimeInterval
}
