//
//  AppDelegate.swift
//  TestPadTraits
//
//  Created by Vladimir Inozemtsev on 19.05.2020.
//  Copyright © 2020 Vladimir Inozemtsev. All rights reserved.
//

import UIKit

@UIApplicationMain
@objc class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

