//
//  MainTabBarController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureContents()
        let homeViewController      = createHomeViewController()
        let discoveryViewController = createDiscoveryViewController()
        viewControllers             = [homeViewController,discoveryViewController]
    }
    
    private func configureTabBarIcons(navController: MainNavigationController, icon:UIImage?) {
        navController.tabBarItem.image = icon
    }
    
    func configureContents(){
        let customTabBar = MainTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
    }
    
    private func createHomeViewController() -> UINavigationController{
        let homeRouter            = HomeRouter()
        let homeViewModel         = HomeViewModel(router: homeRouter)
        let homeViewController    = HomeViewController(viewModel: homeViewModel)
        let navController         = MainNavigationController(rootViewController: homeViewController)
        configureTabBarIcons(navController: navController, icon: Asset.Icons.icHome.image)
        homeRouter.viewController = homeViewController
        return navController
    }
    
    private func createDiscoveryViewController() -> UINavigationController{
        let discoveryRouter            = DiscoveryRouter()
        let discoveryViewModel         = DiscoveryViewModel(router: discoveryRouter)
        let discoveryViewController    = DiscoveryViewController(viewModel: discoveryViewModel)
        let navController              = MainNavigationController(rootViewController: discoveryViewController)
        configureTabBarIcons(navController: navController, icon: Asset.Icons.icDiscovery.image)
        discoveryRouter.viewController = discoveryViewController
        return navController
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            if let mainTabBar = tabBar as? MainTabBar {
                mainTabBar.setNeedsLayout()
            }
        }
}
