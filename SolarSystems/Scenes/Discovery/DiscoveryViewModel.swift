//
//  DiscoveryViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import Foundation

protocol DiscoveryViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> DiscoveryCellProtocol
}

protocol DiscoveryViewEventSource {
    var didSuccessFetchDiscovery: VoidClosure? { get set }
}

protocol DiscoveryViewProtocol: DiscoveryViewDataSource, DiscoveryViewEventSource {}

final class DiscoveryViewModel: BaseViewModel<DiscoveryRouter>, DiscoveryViewProtocol {
    var didSuccessFetchDiscovery: VoidClosure?
    var cellItems               : [DiscoveryCellViewModel] = []
    
    private var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> DiscoveryCellProtocol {
        return cellItems[indexPath.row]
    }
    
    init(router: DiscoveryRouter) {
        super.init(router: router)
    }
}

// MARK: - Network
extension DiscoveryViewModel{
    func fetchDiscovery(listingType: PlanetList){
        var request: GetPlanetsDiscoveryRequest
        switch listingType{
        case .mercury:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .mercury)
        case .venus:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .venus)
        case .earth:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .earth)
        case .mars:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .mars)
        case .jupiter:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .jupiter)
        case .saturn:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .saturn)
        case .uranus:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .uranus)
        case .neptune:
            request = GetPlanetsDiscoveryRequest(page: page, listingType: .neptune)
        }
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            
            switch result{
                
            case .success(let response):
                self.cellItems.removeAll()
                let newItem = DiscoveryCellViewModel(planets: response)
                self.cellItems.append(newItem)
                self.page += 1
                self.didSuccessFetchDiscovery?()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
