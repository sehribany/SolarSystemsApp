//
//  Solars.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 24.01.2024.
//

import Foundation

// MARK: - Solars
struct Solars: Codable {
    let id, name, englishName: String
    let isPlanet: Bool
    let moons: JSONNull?
    let semimajorAxis, perihelion, aphelion: Int
    let eccentricity: Double
    let inclination: Int
    let mass: Mass
    let vol: Vol
    let density, gravity: Double
    let escape: Int
    let meanRadius, equaRadius, polarRadius: Double
    let flattening: Int
    let dimension: String
    let sideralOrbit, sideralRotation: Double
    let aroundPlanet: JSONNull?
    let discoveredBy, discoveryDate, alternativeName: String
    let axialTilt: Double
    let avgTemp: Int
    let mainAnomaly, argPeriapsis, longAscNode: Double
    let bodyType: String
}

// MARK: - Mass
struct Mass: Codable {
    let massValue: Double
    let massExponent: Int
}

// MARK: - Vol
struct Vol: Codable {
    let volValue: Double
    let volExponent: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

