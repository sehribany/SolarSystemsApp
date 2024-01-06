//
//  RequestProtocol.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//

public protocol RequestProtocol{
    var path      : String{ get }
    var method    : RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers   : RequestHeaders { get }
    var encoding  : RequestEncoding { get }
    var url       : String { get }
}
