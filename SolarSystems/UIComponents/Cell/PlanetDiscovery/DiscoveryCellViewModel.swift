//
//  DiscoveryCellViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

public protocol DiscoveryCellDataSource: AnyObject{
    var planets: Planets {get}
}

public protocol DiscoveryCellEventSource: AnyObject{}

public protocol DiscoveryCellProtocol: DiscoveryCellDataSource, DiscoveryCellEventSource{}

public final class DiscoveryCellViewModel: DiscoveryCellProtocol{
    public var planets: Planets
    
    public init(planets: Planets) {
        self.planets = planets
    }
}

