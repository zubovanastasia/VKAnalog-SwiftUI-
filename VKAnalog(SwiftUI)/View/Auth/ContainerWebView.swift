//
//  ContainerWebView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 08.03.2022.
//

import Foundation
import SwiftUI
import WebKit

struct ContainerWebView: View {
    
    @ObservedObject var session = Session.shared
    
    var body: some View {
        
        NavigationView {
            
            HStack {
                VKLoginWebView()
                NavigationLink(destination: TabBar(), isActive: $session.accessGranted) {
                    
                    EmptyView()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.accentColor(.black)
    }
}
