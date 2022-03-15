//
//  ContainerLoginView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import SwiftUI
import Combine

struct ContainerLoginView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            HStack {

                ContentView(isUserLoggedIn: $shouldShowMainView)
                
                NavigationLink(destination: TabBar(), isActive: $shouldShowMainView) {
                
                    EmptyView()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.accentColor(.black)
    }
}
