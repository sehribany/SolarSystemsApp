//
//  DecodableResponseRequest.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

public protocol DecodableResponseRequest : RequestProtocol{
    associatedtype ResponseType : Decodable
}
