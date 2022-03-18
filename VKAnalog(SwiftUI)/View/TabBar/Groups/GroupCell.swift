//
//  GroupCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    let group: GroupModel
    
    var body: some View {
        
        ZStack{
            
            HStack{
                
                UserAvatar {
                    KFImage(URL(string: group.imageURL)!)
                }
                
                TextUserNameBuilder {
                    Text(group.name)
                }
            }.padding()
        }
    }
}
