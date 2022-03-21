//
//  PhotoAPI.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 21.03.2022.
//

import Alamofire
import SwiftUI

protocol PhotoService {
    func getPhoto(friendID: String, completion: @escaping([PhotoModel]?) -> ())
}

class PhotoAPI: UIImageView, PhotoService {
    @ObservedObject var session = Session.shared
    
    var request: String?
    let baseUrl = "https://api.vk.com/method"
    let version = "5.81"
    let method = "/photos.getAll"
    var params: Parameters = [:]
    
    func getPhoto(friendID: String = "", completion: @escaping([PhotoModel]?) -> ()) {
        self.params = [
            "owner_id": friendID,
            "client_id": "7822904",
            "user_id": session.userId,
            "access_token": session.token,
            "v": version,
            "no_service_albums": 0,
            "count": 10,
            "extended": 1,
            "photo_sizes": 1
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            guard let data = response.data else { return }
            
            do {
                let photoResponse = try? JSONDecoder().decode(Photos.self, from: data)
                let photos = photoResponse?.response.items
                
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}
