//
//  GroupViewModel.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
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
