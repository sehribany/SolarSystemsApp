//
//  GetSolarRequest.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

public struct GetSolarRequest: APIDecodableResponseRequest{
    public typealias ResponseType = [Planets]

    public var path      : String            = ""
    public var method    : RequestMethod     = .get
    public var parameters: RequestParameters = [:]
    public var headers   : RequestHeaders    = [:]

    public init(page: Int, solarName: String){
        self.parameters["page"] = page
        self.path = "/\(solarName)"
    }
}
