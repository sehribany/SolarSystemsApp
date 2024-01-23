//
//  Solar.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//


// MARK: - Planets
public struct Planets: Codable {
    var name, tagline: String
    let tagline_icon: String
    let picture, textureUrl: String
    let description, distanceFromSun, yearLength: String
    let numberOfMoons: Int
    let namesake: String
    let rings: Rings
    let spaceTexture_url: String
}

// MARK: - Rings
public struct Rings: Codable {
    let url_exists: Bool
}
