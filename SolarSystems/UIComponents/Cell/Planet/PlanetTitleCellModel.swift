//
//  PlanetTitleCellModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 23.01.2024.
//

public protocol PlanetTitleCellDataSource: AnyObject {
    var planets: Planets{get}
}

public protocol PlanetTitleCellEventSource: AnyObject {}

public protocol PlanetTitleCellProtocol: PlanetTitleCellDataSource, PlanetTitleCellEventSource {}

public final class PlanetTitleCellModel: PlanetTitleCellProtocol {
    public var planets: Planets
    
    public init(planets: Planets) {
        self.planets = planets
    }
}
