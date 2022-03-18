//
//  Session.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 17.02.2022.
//

import SwiftUI

class Session: ObservableObject {
    
    static let shared = Session()
    
    private init() {}
    
    @Published var token: String = ""
    @Published var userId: String = ""
    @Published var accessGranted = false
}
