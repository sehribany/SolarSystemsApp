//
//  HeaderView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

import UIKit

public class HeaderView: UICollectionReusableView {
    public static var identifier: String = "HeaderView"
    
    public let nestedCollectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Asset.Colors.appWhite.color
        collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.identifier)
        return collectionView
    }()
    
    init(frame: CGRect, viewModel: HeaderViewProtocol) {
        self.viewmodel = viewModel
        super.init(frame: frame)
        addSubViews()
    }

    override init(frame: CGRect) {
        self.viewmodel = HeaderViewModel()
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        self.viewmodel = HeaderViewModel()
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    weak var viewModel: HeaderViewCellProtocol?
    var viewmodel     : HeaderViewProtocol
    var delegate      : HeaderViewEventSource?
}

// MARK: - UILayout
extension HeaderView{
    
    private func addSubViews(){
        addCollectionView()
    }
    
    private func addCollectionView(){
        addSubview(nestedCollectionView)
        nestedCollectionView.dataSource = self
        nestedCollectionView.delegate   = self
        let inset: CGFloat              = 9.0
        nestedCollectionView.frame      = CGRect(x: inset, y: bounds.origin.y, width: bounds.width - inset, height: bounds.height)
    }
}
// MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension HeaderView : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfItemsAt(section: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell                = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
        cell.backgroundColor    = .clear
        cell.layer.borderWidth  = 0.4
        cell.layer.borderColor  = Asset.Colors.appDark.color.cgColor
        cell.layer.cornerRadius = 10
        let cellItem            = viewmodel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellItem  = viewmodel.cellItemAt(indexPath: indexPath)
        let titleText = cellItem.titleText
        let label     = HeaderViewCell().titleLabel
        label.text    = titleText
        let textWidth = label.contentWidth()
        let cellWidth = textWidth + 20
        let cellHeight: CGFloat = 30
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate!.didSelectHeaderItem(at: indexPath)
    }
}

