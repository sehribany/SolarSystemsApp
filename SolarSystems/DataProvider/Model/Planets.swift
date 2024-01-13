//
//  Solar.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//

public struct Planets: Codable {
    let id             : String
    let name           : String
    let englishName    : String  //name
    let isPlanet       : Bool
    let moons          : [Moon]
    let semimajorAxis  : Int     //yarı büyük eksen
    let perihelion     : Int     //günberi
    let aphelion       : Int     //günöte
    let eccentricity   : Double
    let inclination    : Double  // Eğim
    let mass           : Mass    // Kütle
    let vol            : Vol     // Hacim
    let density        : Double
    let gravity        : Double
    let escape         : Int
    let meanRadius     : Double
    let equaRadius     : Double
    let polarRadius    : Double
    let flattening     : Double
    let dimension      : String
    let sideralOrbit   : Double
    let sideralRotation: Double
    let aroundPlanet   : String
    let discoveredBy   : String
    let discoveryDate  : String 
    let alternativeName: String
    let axialTilt      : Double
    let avgTemp        : Int
    let mainAnomaly    : Double
    let argPeriapsis   : Double
    let longAscNode    : Double
    let bodyType       : String
   
    
    public init(id:String,name:String,englishName:String, isPlanet:Bool,moons:[Moon],semimajorAxis:Int,perihelion:Int,aphelion:Int,eccentricity:Double,inclination:Double, density:Double,gravity:Double,escape:Int,meanRadius:Double,discoveredBy:String,discoveryDate:String,alternativeName:String,axialTilt:Double,avgTemp:Int,bodyType:String,
        mass:Mass,vol:Vol,equaRadius:Double,polarRadius:Double,flattening:Double,dimension:String,sideralOrbit:Double,sideralRotation:Double, aroundPlanet:String,
        mainAnomaly:Double,argPeriapsis:Double,longAscNode:Double) {
        self.id              = id
        self.name            = name
        self.englishName     = englishName
        self.isPlanet        = isPlanet
        self.moons           = moons
        self.semimajorAxis   = semimajorAxis
        self.perihelion      = perihelion
        self.aphelion        = aphelion
        self.eccentricity    = eccentricity
        self.inclination     = inclination
        self.vol             = vol
        self.density         = density
        self.gravity         = gravity
        self.escape          = escape
        self.meanRadius      = meanRadius
        self.equaRadius      = equaRadius
        self.polarRadius     = polarRadius
        self.flattening      = flattening
        self.dimension       = dimension
        self.sideralOrbit    = sideralOrbit
        self.sideralRotation = sideralRotation
        self.aroundPlanet    = aroundPlanet
        self.discoveredBy    = discoveredBy
        self.discoveryDate   = discoveryDate
        self.alternativeName = alternativeName
        self.axialTilt       = axialTilt
        self.avgTemp         = avgTemp
        self.mainAnomaly     = mainAnomaly
        self.argPeriapsis    = argPeriapsis
        self.longAscNode     = longAscNode
        self.bodyType        = bodyType
        self.mass            = mass
    }
}

// MARK: - Mass
public struct Mass: Codable {
    let massValue   : Double
    let massExponent: Int
    
    public init(massValue: Double,  massExponent: Int ){
        self.massValue    = massValue
        self.massExponent = massExponent
    }
}

// MARK: - Moon
public struct Moon: Codable {
    let moon: String
    let rel: String
}

// MARK: - Vol
public struct Vol: Codable {
    let volValue: Double
    let volExponent: Int
}
