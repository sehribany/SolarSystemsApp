//
//  CelestialBodiesViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import Foundation

protocol CelestialBodiesViewDataSource {}

protocol CelestialBodiesViewEventSource {}

protocol CelestialBodiesViewProtocol: CelestialBodiesViewDataSource, CelestialBodiesViewEventSource {}

final class CelestialBodiesViewModel: BaseViewModel<CelestialBodiesRouter>, CelestialBodiesViewProtocol {
    
}
