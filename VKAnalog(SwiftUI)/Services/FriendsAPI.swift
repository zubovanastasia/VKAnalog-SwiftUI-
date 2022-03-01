//
//  FriendsAPI.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 17.02.2022.
//

import Foundation
import Alamofire

protocol FriendService {
    func getFriends(completion: @escaping (Friends?) -> ())
}

final class FriendsAPI: FriendService {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    var request: String?
    
    func getFriends(completion: @escaping (Friends?) -> ()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "userId": userId,
            "order": "name",
            "fields": "photo_50, photo_100",
            "count": 50,
            "v": version,
            "access_token": token
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            self.request = response.request?.description
            
            guard let data = response.data else { return }
            
            do {
                var friends: Friends
                friends = try JSONDecoder().decode(Friends.self, from: data)
                completion(friends)
                
            } catch {
                print(error)
            }
            
        }
    }
}
