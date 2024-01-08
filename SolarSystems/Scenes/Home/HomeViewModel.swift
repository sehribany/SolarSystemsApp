//
//  HomeViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import Foundation

protocol HomeViewDataSource {
    var segmentedControlTitles: [String] { get }
    var selectedSegmentIndex  : Int { get }
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var selectedSegmentIndex  : Int = 0
    var segmentedControlTitles: [String] = [ L10n.Segments.Segments.firstTitle,
                                             L10n.Segments.Segments.secondTitle,
                                             L10n.Segments.Segments.thirdTitle]
}
