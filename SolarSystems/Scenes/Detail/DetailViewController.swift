//
//  DetailViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let planetDetailView = PlanetDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appOrange1
        addSubView()
        configure()
        viewModel.fetchPlanets()
        
    }
    
}

// MARK: - UILayout
extension DetailViewController{
    private func addSubView(){
        view.addSubview(planetDetailView)
        planetDetailView.edgesToSuperview()
    }
    
    private func configure(){
        planetDetailView.nameLabel.text = viewModel.planetDetail?.englishName
    }
}
