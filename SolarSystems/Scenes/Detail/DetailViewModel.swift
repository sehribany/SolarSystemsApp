//
//  DetailViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

protocol DetailViewDataSource {
    var planetDetail: Planets {get}
}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    var planetDetail: Planets
    
    init(planetDetail: Planets, router: DetailRouter) {
        self.planetDetail = planetDetail
        super.init(router: router)
    }
}
