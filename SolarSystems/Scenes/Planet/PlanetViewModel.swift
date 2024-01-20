//
//  PlanetViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import Foundation

import Foundation

protocol PlanetViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> PlanetCellProtocol
}

protocol PlanetViewEventSource {}

protocol PlanetViewProtocol: PlanetViewDataSource, PlanetViewEventSource {
   
    
}

final class PlanetViewModel: BaseViewModel<PlanetRouter>, PlanetViewProtocol {

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
    
    
    init(router: PlanetRouter) {
        super.init(router: router)
    }
}
