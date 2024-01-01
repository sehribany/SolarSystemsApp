//
//  SceneDelegate.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }

            let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")

            if !isFirstLaunch {
                let introViewController = IntroViewController()
                window = UIWindow(windowScene: windowScene)
                window?.rootViewController = introViewController
                window?.makeKeyAndVisible()
                UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            } else {
                let mainTabBarController = MainTabBarController()
                window = UIWindow(windowScene: windowScene)
                window?.rootViewController = mainTabBarController
                window?.makeKeyAndVisible()
            }
        }
}
