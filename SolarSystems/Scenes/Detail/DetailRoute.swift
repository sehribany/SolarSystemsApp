//
//  DetailRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

import Foundation

protocol DetailRoute{
    func pushPlanetDetail(planetDetail: Planets)
}

extension DetailRoute where Self: RouterProtocol{
    func pushPlanetDetail(planetDetail: Planets){
        let router         = DetailRouter()
        let viewModel      = DetailViewModel(planetDetail: planetDetail, router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
