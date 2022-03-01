//
//  GroupsAPI.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 01.03.2022.
//

import SwiftUI
import Alamofire

protocol GroupService {
    func getGroups(completion: @escaping (Groups?) -> ())
}

final class GroupsAPI: GroupService {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getGroups(completion: @escaping(Groups?) -> ()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "access_token": token,
            "v": version,
            "extended": 1
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.data else { return }
            
            do {
                var groups: Groups
                groups = try JSONDecoder().decode(Groups.self, from: data)
                completion(groups)
                
            } catch {
                print(error)
            }
        }
    }
}
