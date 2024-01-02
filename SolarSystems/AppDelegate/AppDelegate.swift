//
//  AppDelegate.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        AppRoute.shared.startApp()
        self.window?.makeKeyAndVisible()
        return true
    }
}

