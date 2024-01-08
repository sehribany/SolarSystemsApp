//
//  HomeRoute.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

protocol HomeRoute{
    func placeOnWindowHome()
}

extension HomeRoute where Self: RouterProtocol{
    func placeOnWindowHome() {
        let router               = HomeRouter()
        let viewModel            = HomeViewModel(router: router, dataProvider: APIDataProvider())
        let viewController       = HomeViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition           = PlaceOnWindowTransition()
        router.viewController    = viewController
        router.openTransition    = transition
        
        open(navigationController, transition: transition)
    }
}
