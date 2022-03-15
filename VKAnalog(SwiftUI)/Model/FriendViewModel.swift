//
//  FriendViewModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI

class FriendViewModel: ObservableObject {
    
    @Published var friends: [FriendsModel] = []
    let friendsService: FriendService
    
    init(friendsService: FriendService) {
        self.friendsService = friendsService
    }
    
    public func fetchFriends() {
        friendsService.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = friends!.response.items
        }
    }
}
