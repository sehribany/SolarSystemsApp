//
//  DiscoveryViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import UIKit

final class DiscoveryViewController: BaseViewController<DiscoveryViewModel> {
        
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.register(DiscoveryCell.self,forCellWithReuseIdentifier: DiscoveryCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        addSubViews()
        configureContents()
        viewModel.fetchDiscovery(listingType: .mercury)
        subscribeViewModelEvents()
    }
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchDiscovery = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UILayout
extension DiscoveryViewController{
    private func addSubViews(){
        addCollectionView()
    }
    
    private func addCollectionView(){
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - Configure and Set Localize
extension DiscoveryViewController {
    private func configureContents() {
        collectionView.backgroundColor = .clear
        collectionView.delegate        = self
        collectionView.dataSource      = self
    }
}
// MARK: -HeaderViewEventSource
extension DiscoveryViewController{
    func didSelectHeaderItem(at index: IndexPath){
        switch index.item{
        case 0:
            viewModel.fetchDiscovery(listingType: .mercury)
        case 1:
            viewModel.fetchDiscovery(listingType: .venus)
        case 2:
            viewModel.fetchDiscovery(listingType: .earth)
        case 3:
            viewModel.fetchDiscovery(listingType: .mars)
        case 4:
            viewModel.fetchDiscovery(listingType: .jupiter)
        case 5:
            viewModel.fetchDiscovery(listingType: .saturn)
        case 6:
            viewModel.fetchDiscovery(listingType: .uranus)
        case 7:
            viewModel.fetchDiscovery(listingType: .neptune)
        default:
            break
        }
        func didSelectHeaderItem(at index: IndexPath) {
            guard let listingType = PlanetList(rawValue: index.item) else { return }
            viewModel.fetchDiscovery(listingType: listingType)
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension DiscoveryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DiscoveryCell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoveryCell.identifier, for: indexPath) as! DiscoveryCell
        let cellItem = self.viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            //headerView.delegate = DiscoveryViewController
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width/7)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DiscoveryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width - 260)
    }
}
