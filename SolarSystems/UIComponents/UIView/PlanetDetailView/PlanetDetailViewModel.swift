//
//  PlanetDetailViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 23.01.2024.
//

import Foundation

public protocol PlanetDetailViewDataSource: AnyObject{
    var planet: Planets {get}
}

public protocol PlanetDetailViewEventSource: AnyObject{}

public protocol PlanetDetailViewProtocol: PlanetDetailViewDataSource, PlanetDetailViewEventSource{}

public final class PlanetDetailViewModel: PlanetDetailViewProtocol{
    public var planet: Planets
    
    init(planet: Planets) {
        self.planet = planet
    }
}
