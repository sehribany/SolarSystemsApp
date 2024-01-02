//
//  AppRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//
import MobilliumUserDefaults

final class AppRoute: Router, AppRoute.Routes{
    typealias Routes  = IntroRoute & MainTabBarRoute
    static let shared = AppRoute()
    
    func startApp(){
        if DefaultsKey.isIntroCompleted.value == true{
            presentMainTabBar()
        }else{
            presentIntro()
        }
    }
    
    private func topViewController() -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let relevantWindows = windowScene.windows.filter { $0.isKeyWindow }
            if let keyWindow = relevantWindows.first {
                var topController = keyWindow.rootViewController
                while let presentedViewController = topController?.presentedViewController {
                    topController = presentedViewController
                }
                return topController
            }
        }
        return nil
    }
}
