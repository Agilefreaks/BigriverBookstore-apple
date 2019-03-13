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

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let _ = NSClassFromString("XCTest") {
            return true
        }

        window = UIWindow(frame: UIScreen.main.bounds)

        if let window = window {
            let mainViewController = BookListViewController.getInstance()
            let mainViewModel = BookListViewModel()
            mainViewController.viewModel = mainViewModel
            navigationController = UINavigationController(rootViewController: mainViewController)
            navigationController?.navigationBar.tintColor = .black
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }

        return true
    }
}
