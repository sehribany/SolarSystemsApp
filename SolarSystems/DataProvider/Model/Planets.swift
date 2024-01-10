//
//  Solar.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//

public struct Planets: Codable {
    let id             : String
    let englishName    : String
    let semimajorAxis  : Int
    let perihelion     : Int
    let aphelion       : Int
    let inclination    : Double
    let density        : Double
    let gravity        : Double
    let escape         : Int
    let meanRadius     : Double
    let discoveredBy   : String
    let discoveryDate  : String 
    let alternativeName: String
    let axialTilt      : Double
    let avgTemp        : Int
    
    public init(id:String, englishName:String, semimajorAxis:Int , perihelion:Int, aphelion:Int, inclination:Double, density:Double, gravity:Double, escape: Int,
                meanRadius:Double, discoveredBy:String, discoveryDate:String, alternativeName:String, axialTilt:Double, avgTemp:Int) {
        self.id              = id
        self.englishName     = englishName
        self.semimajorAxis   = semimajorAxis
        self.perihelion      = perihelion
        self.aphelion        = aphelion
        self.inclination     = inclination
        self.density         = density
        self.gravity         = gravity
        self.escape          = escape
        self.meanRadius      = meanRadius
        self.discoveredBy    = discoveredBy
        self.discoveryDate   = discoveryDate
        self.alternativeName = alternativeName
        self.axialTilt       = axialTilt
        self.avgTemp         = avgTemp
    }
}
