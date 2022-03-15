//
//  GroupListView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.02.2022.
//

import SwiftUI
import Kingfisher

struct GroupListView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .gray
    }
    
    var body: some View {
        
        ZStack{
            
            List {
                ForEach (viewModel.groups) { group in
                    GroupCell(group: group)
                    
                        .listRowBackground(Color.init(uiColor: .gray))
                        .navigationBarTitle(Text("Groups"), displayMode: .large)
                }
                .listStyle(.grouped)
            }
        }
    }
}
