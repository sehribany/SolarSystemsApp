//
//  PlanetRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

protocol PlanetRoute{
    func pushPlanet()
}

extension PlanetRoute where Self: RouterProtocol{
    func pushNews() {
        let router            = PlanetRouter()
        let viewModel         = PlanetViewModel(router: router)
        let viewController    = PlanetViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
