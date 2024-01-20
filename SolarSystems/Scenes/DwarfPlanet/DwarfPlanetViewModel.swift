//
//  DwarfPlanetViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import Foundation

protocol DwarfPlanetViewDataSource {}

protocol DwarfPlanetViewEventSource {}

protocol DwarfPlanetViewProtocol: DwarfPlanetViewDataSource, DwarfPlanetViewEventSource {}

final class DwarfPlanetViewModel: BaseViewModel<DwarfPlanetRouter>, DwarfPlanetViewProtocol {
    
}
