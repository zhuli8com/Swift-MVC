//
//  AppDelegate.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/30.
//  Copyright © 2020 lizhu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

