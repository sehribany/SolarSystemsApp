//
//  DetailRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

import Foundation

protocol DetailRoute{
    func pushPlanetDetail(planetName: String)
}

extension DetailRoute where Self: RouterProtocol{
    func pushPlanetDetail(planetName: String){
        let router         = DetailRouter()
        let viewModel      = DetailViewModel(planetName: planetName, router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
