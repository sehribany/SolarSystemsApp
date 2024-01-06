//
//  DataProvider.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
