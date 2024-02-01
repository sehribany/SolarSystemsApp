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
        tabBarController?.tabBar.isHidden = true
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
        configure()
    }
}

// MARK: - Configure and Set Localize
extension DetailViewController {
    
    public func configure(){
        detailCardView.cardView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    public func set() {
        detailCardView.backGround.image = Asset.Images.starsBackground.image
        detailCardView.cardView.imageView.setImage(viewModel.planetDetail.picture)
        detailCardView.titleLabel.text = viewModel.planetDetail.name
        detailCardView.descriptionLabel.text = viewModel.planetDetail.description
        detailCardView.moonsValueTitle.text  = String( viewModel.planetDetail.numberOfMoons)
    }
}
