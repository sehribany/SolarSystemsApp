//
//  DiscoveryViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import Foundation

protocol DiscoveryViewDataSource {}

protocol DiscoveryViewEventSource {}

protocol DiscoveryViewProtocol: DiscoveryViewDataSource, DiscoveryViewEventSource {}

final class DiscoveryViewModel: BaseViewModel<DiscoveryRouter>, DiscoveryViewProtocol {
    
}
