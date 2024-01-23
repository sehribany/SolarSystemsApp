//
//  DetailViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 9.01.2024.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let detailCardView = PlanetDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appOrange1
        addSubViews()
        set()
    }
}
// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        addDetailView()
    }
    
    private func addDetailView() {
        view.addSubview(detailCardView)
        detailCardView.edgesToSuperview()
    }
}

// MARK: - Configure and Set Localize
extension DetailViewController {
    public func set() {
        detailCardView.titleLabel.text = viewModel.planetDetail.name
        detailCardView.imageView.setImage(viewModel.planetDetail.picture)
    }
}
