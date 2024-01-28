//
//  GetPlanetsDiscoveryRequest.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

public enum PlanetList: Int{
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}

public struct GetPlanetsDiscoveryRequest: APIDecodableResponseRequest{
    public typealias ResponseType = Planets
    
    public var path       : String            = ""
    public var method     : RequestMethod     = .get
    public var parameters : RequestParameters = [:]
    public var headers    : RequestHeaders    = [:]
    public let listingType: PlanetList
    
    public init(page: Int, listingType: PlanetList){
        self.parameters["page"] = page
        self.listingType = listingType
        
        switch listingType{
        case .mercury:
            path = "Mercury"
        case .venus:
            path = "Venus"
        case .earth:
            path = "Earth"
        case .mars:
            path = "Mars"
        case .jupiter:
            path = "jupiter"
        case .saturn:
            path = "Saturn"
        case .uranus:
            path = "Uranus"
        case .neptune:
            path = "Neptune"
        }
    }
}
