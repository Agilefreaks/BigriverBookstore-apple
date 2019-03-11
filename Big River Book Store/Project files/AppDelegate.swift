//
//  AppDelegate.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "BookListViewController")
            navigationController = UINavigationController(rootViewController: controller)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }

}

