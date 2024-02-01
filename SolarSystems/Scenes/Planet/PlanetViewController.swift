//
//  PlanetViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import UIKit

final class PlanetViewController: BaseViewController<PlanetViewModel> {
    
    private let backGround: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let collectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(PlanetCell.self, forCellWithReuseIdentifier: PlanetCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundDraw()
        addSubViews()
        configureContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}
// MARK: - UILayout
extension PlanetViewController {
    
    private func addSubViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.topToSuperview().constant    = 185
        collectionView.bottomToSuperview().constant = -150
    }
    
    private func backgroundDraw(){
        view.addSubview(backGround)
        backGround.image = Asset.Images.starsBackground.image
        backGround.edgesToSuperview()
    }
}

// MARK: - Configure and Set Localize
extension PlanetViewController {
    private func configureContents() {
        collectionView.delegate   = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension PlanetViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlanetCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCell.identifier, for: indexPath) as! PlanetCell
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.fetchPlanets(forSelectedIndex: indexPath.row) { [weak self] in                
            self?.viewModel.showPlanetsDetail(at: indexPath)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PlanetViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
