//
//  NewsCell.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI

struct NewsCell: View {
    
    let new: NewsModel
    
    var body: some View {
        
        ZStack {
            
            VStack{
                HStack{
                    //   UserAvatar {
                    //   KFImage(URL(string: new.imagePost!)!)
                    //    }
                    Text(new.name)
                        .modifier(TextUserNameModifier(size: 13, style: .regular, design: .default))
                    Spacer()
                }
                HStack{
                    Text(new.textPost)
                    Spacer()
                }
                HStack{
                    
                    Image(new.imagePost)
                        .frame(width: 300, height: 300, alignment: .center)
                    Spacer()
                }
                HStack{
                    
                    LikeButtonCell()
                    
                    Spacer()}
                
            }.padding()
        }
    }
}
