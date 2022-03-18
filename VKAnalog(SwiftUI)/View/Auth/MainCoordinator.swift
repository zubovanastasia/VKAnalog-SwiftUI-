//
//  MainCoordinator.swift
//  VKAnalog(SwiftUI)
//
//  Created by Anastasiia Zubova on 18.03.2022.
//

import UIKit
import Combine
import SwiftUI

class MainCoordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    // MARK: - Private Properties
    
    private var loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Construction
    
    init(navigationController: UINavigationController) {
        let loginView = LoginView(viewModel: loginViewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginViewController)
    }
    
    // MARK: - Functions
    
    public func start() {
        loginViewModel.$isUserLoggedIn.subscribe(on: RunLoop.main).sink { [weak self] isUserLoggedIn in
            guard let self = self else { return }
            
            if !isUserLoggedIn {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let tabBarViewController = self.createTabBarController()
                self.navigationController.pushViewController(tabBarViewController, animated: true)
            }
        }.store(in: &cancellables)
    }
    private func createTabBarController() -> UIViewController {
        let tabBarView = TabBar()
        return UIHostingController(rootView: tabBarView)
    }
}
