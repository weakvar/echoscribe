//
//  AppDelegate.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder {
    
    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Private Methods
    
    private func setRootViewController() {
        let viewController = SubscriptionsAssembly.assembly()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.tintColor = .systemTeal
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        
        return true
    }
    
}
