//
//  ContentView.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 05.02.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
   
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true},
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false}
    )
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.init(uiColor: .lightGray), .black]),
                        startPoint: .top,
                        endPoint: .bottom))
            
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    
                    Spacer(minLength: 175)
                    
                    VStack{
                        if shouldShowLogo {
                            Text("VK")
                                .font(.system(size: 50, weight: .thin, design: .rounded))
                                .foregroundStyle(
                                       .linearGradient(
                                        colors: [.init(uiColor: .darkGray), .black, .black],
                                        startPoint: .top,
                                        endPoint: .bottom
                                       )
                                   )
                                   
                            
                            Spacer(minLength: -10)
                            
                            Text("ANALOG")
                                .font(.system(size: 12, weight: .thin, design: .rounded))
                             //   .blur(radius: 0.5)
                                .foregroundStyle(Color.init(uiColor: .darkGray))
                        }
                        
                        Spacer(minLength: 70)
                        
                        VStack {
                            TextField("Login", text: $login)
                                .opacity(0.4)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                                .background(Color.clear)
                            
            
                            Spacer(minLength: 15)
                            
                            SecureField("Password", text: $password)
                                .opacity(0.4)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                                .background(Color.clear)
                        }
                        
                        .frame(maxWidth: 250)
                        
                        Spacer(minLength: 50)
                        
                        Button {
                            print("Hello")
                        } label: {
                            Text("L O G   I N")
                                .padding()
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .frame(width: 250, height: 50, alignment: .center)
                        }
                        .disabled(login.isEmpty || password.isEmpty)
                        }
                }.onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        self.shouldShowLogo = isKeyboardOn
                    }
                }
            }
            
            Spacer(minLength: 150)
            
        } .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
