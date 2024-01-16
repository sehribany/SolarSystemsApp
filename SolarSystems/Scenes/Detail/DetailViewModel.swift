//
//  DetailViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

import Foundation

protocol DetailViewDataSource {
    var planetDetail: Planets? {get}
    var planetName  : String { get}
}

protocol DetailViewEventSource {
    var didSuccessFetchPlanets: VoidClosure? { get set }
}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {

    var planetDetail          : Planets?
    var didSuccessFetchPlanets: VoidClosure?
    var planetName            : String
    
    private var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    
    init(planetName: String,router: DetailRouter) {
        self.planetName = planetName
        super.init(router: router)
    }
}

// MARK: - Network
extension DetailViewModel{
    func fetchPlanets(){
        let request = GetSolarRequest(page: page, solarName: planetName)
        self.isRequestEnabled = false
        
        if page == 1 {showActivityIndicatorView?()}
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else {return}
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case.success(let response):
               
                self.page += 1
                self.didSuccessFetchPlanets?()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
