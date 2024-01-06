//
//  APIRequestInterceptor.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

import Alamofire

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let urlRequest = urlRequest
        completion(.success(urlRequest))
    }
}
