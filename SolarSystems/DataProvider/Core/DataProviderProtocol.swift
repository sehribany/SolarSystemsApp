//
//  DataProviderProtocol.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol{
    
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
