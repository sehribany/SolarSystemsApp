//
//  MainTabBarRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

protocol MainTabBarRoute {
    func presentMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol{
    func presentMainTabBar(){
        let mainTabBarController = MainTabBarController()
        let transition           = PlaceOnWindowTransition()
        open(mainTabBarController, transition: transition)
    }
}
