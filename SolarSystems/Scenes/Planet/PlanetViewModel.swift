//
//  PlanetViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import Foundation

protocol PlanetViewDataSource {
    func numberOfItemsAt(section: Int)         -> Int
    func cellItemAt(indexPath: IndexPath)      -> PlanetCellProtocol
    func cellItemAtTitle(indexPath: IndexPath) -> PlanetTitleCellProtocol
}

protocol PlanetViewEventSource {
    var didSuccessFetchPlanets: VoidClosure? { get set }
}

protocol PlanetViewProtocol: PlanetViewDataSource, PlanetViewEventSource {
    func showPlanetsDetail(at indexPath : IndexPath)
}

final class PlanetViewModel: BaseViewModel<PlanetRouter>, PlanetViewProtocol {
    
    var didSuccessFetchPlanets: VoidClosure?
    var cellItem              : [PlanetTitleCellModel] = []
    
    private var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    private var cellItems: [PlanetCellProtocol] = [PlanetCellModel(image: Asset.Images.mercury.image,
                                                                   titleText: L10n.Planets.Mercury.name,
                                                                   descriptionText: L10n.Planets.Mercury.title, textColor: .appMercury),
                                                  PlanetCellModel(image: Asset.Images.venus.image,
                                                                  titleText: L10n.Planets.Venus.name,
                                                                  descriptionText: L10n.Planets.Venus.title, textColor: .appVenus),
                                                  PlanetCellModel(image: Asset.Images.earth.image,
                                                                  titleText: L10n.Planets.Earth.name,
                                                                  descriptionText: L10n.Planets.Earth.title, textColor: .appEarth),
                                                   PlanetCellModel(image: Asset.Images.mars.image,
                                                                   titleText: L10n.Planets.Mars.name,
                                                                   descriptionText: L10n.Planets.Mars.title, textColor: .appMars),
                                                   PlanetCellModel(image: Asset.Images.jupiter.image,
                                                                   titleText: L10n.Planets.Jupiter.name,
                                                                   descriptionText: L10n.Planets.Jupiter.title, textColor: .appJupiter),
                                                   PlanetCellModel(image: Asset.Images.saturn.image,
                                                                   titleText: L10n.Planets.Saturn.name,
                                                                   descriptionText: L10n.Planets.Saturn.title, textColor: .appSaturn),
                                                   PlanetCellModel(image: Asset.Images.uranus.image,
                                                                   titleText: L10n.Planets.Uranus.name,
                                                                   descriptionText: L10n.Planets.Uranus.title, textColor: .appUranus),
                                                   PlanetCellModel(image: Asset.Images.neptune.image,
                                                                   titleText: L10n.Planets.Neptun.name,
                                                                   descriptionText: L10n.Planets.Neptun.title, textColor: .appNeptun)]
    
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> PlanetCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func cellItemAtTitle(indexPath: IndexPath) -> PlanetTitleCellProtocol {
        
        return cellItem[indexPath.row]
    }
    
    func showPlanetsDetail(at indexPath: IndexPath){
        guard indexPath.row >= 0 && indexPath.row < cellItem.count else {return}
        let planet = cellItem[indexPath.row]
        router.pushPlanetDetail(planetDetail: planet.planets)
    }
    
    init(router: PlanetRouter) {
        super.init(router: router)
    }
}

// MARK: - Network
extension PlanetViewModel{

    func fetchPlanets(forSelectedIndex index: Int, completion: @escaping () -> Void) {
        
        guard index >= 0, index < cellItems.count else { return }
            
        let selectedCellItem = cellItems[index]
        let titleText = selectedCellItem.titleText
        let request = GetSolarRequest(page: page, solarName: titleText)
        self.isRequestEnabled = false
            
        if page == 1 {showActivityIndicatorView?()}
            
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
                
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
                
            switch result {
            case .success(let response):
                let newItem = PlanetTitleCellModel(planets: response)
                if self.cellItem.isEmpty{
                    self.cellItem = [newItem]
                }else{
                    self.cellItem.append(newItem)
                }
                self.page += 1
                self.didSuccessFetchPlanets?()
                completion()
                    
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
