//
//  DiscoveryRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

protocol DiscoveryRoute{
    func openPlanetsDiscovery()
}

extension DiscoveryRoute where Self: RouterProtocol{
    
    func openPlanetDiscovery(){
        let router               = DiscoveryRouter()
        let viewModel            = DiscoveryViewModel(router: router)
        let viewController       = DiscoveryViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)

        let transition           = PushTransition()
        router.viewController    = viewController
        router.openTransition    = transition
        
        open(navigationController, transition: transition)
    }
}

