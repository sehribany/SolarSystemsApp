//
//  HeaderViewModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

import Foundation

protocol HeaderViewDataSource {
    func numberOfItemsAt(section: Int)    -> Int
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol
}

protocol HeaderViewEventSource {
    func didSelectHeaderItem(at index: IndexPath)
}

protocol HeaderViewProtocol: HeaderViewDataSource, HeaderViewEventSource {}

final class HeaderViewModel: HeaderViewProtocol {

    private var cellCategories : [HeaderViewCellProtocol] = [HeaderViewCellModel(titleText: "Mercury"),
                                                             HeaderViewCellModel(titleText: "Venus"),
                                                             HeaderViewCellModel(titleText: "Earth"),
                                                             HeaderViewCellModel(titleText: "Mars"),
                                                             HeaderViewCellModel(titleText: "Jupiter"),
                                                             HeaderViewCellModel(titleText: "Saturn"),
                                                             HeaderViewCellModel(titleText: "Uranus"),
                                                             HeaderViewCellModel(titleText: "Neptune")]
    
    func numberOfItemsAt(section: Int) -> Int {
        cellCategories.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol {
        cellCategories[indexPath.row]
    }
    
    func didSelectHeaderItem(at index: IndexPath) {
        print(index)
    }
}
