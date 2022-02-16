//
//  GroupListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI

struct GroupListView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .gray
    }
    
    @State private var groups: [GroupModel] = [
        GroupModel(name: "Music", imageName: "111"),
        GroupModel(name: "IT", imageName: "111"),
        GroupModel(name: "Sport", imageName: "111"),
        GroupModel(name: "Cinema", imageName: "111")
    ]
    
    var body: some View {
        
        ZStack{
            
            List {
                ForEach (groups.sorted(by: { $0.name < $1.name })) { group in
                    GroupCell(group: group)
                    
                        .listRowBackground(Color.init(uiColor: .gray))
                        .navigationBarTitle(Text("Groups"), displayMode: .large)
                }
                .listStyle(.grouped)
            }
        }
    }
}

struct GroupCell: View {
    
    let group: GroupModel
    
    var body: some View {
        
        ZStack{
            
            HStack{
                
                UserAvatar {
                    Image(group.imageName)
                }
                
                TextUserNameBuilder {
                    Text(group.name)
                }
            }.padding()
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}
