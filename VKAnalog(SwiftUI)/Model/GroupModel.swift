//
//  GroupModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 13.02.2022.
//

import SwiftUI

class GroupViewModel: ObservableObject {
    
    @Published var groups: [GroupModel] = []
    let groupService: GroupService
    
    init(groupService: GroupService) {
        self.groupService = groupService
    }
    
    public func fetch() {
        groupService.getGroups() { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups!.response.items
        }
    }
}
// MARK: - Main
struct Groups: Codable {
    let response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupModel]
}

// MARK: - Item
class GroupModel: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var groupDescription: String?
    var imageURL: String = ""
    var membersCount: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}
