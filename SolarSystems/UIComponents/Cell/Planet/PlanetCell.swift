//
//  PlanetCell.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//

import UIKit

public class PlanetCell: UICollectionViewCell, ReusableView {
    
    public static var identifier: String = "PlanetCell"
    
    private let planetCard = PlanetCardView()
    
    private var imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Asset.Icons.icGo.image, for: .normal)
        return button
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.appWhite.color.withAlphaComponent(0.6)
        return view
    }()
    
    weak var viewModel: PlanetCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }

    public func set(viewModel: PlanetCellProtocol) {
        self.viewModel                   = viewModel
        let planet                       = viewModel
        imageView.image                  = planet.image
        planetCard.titleLabel.text       = planet.titleText
        planetCard.descriptionLabel.text = planet.descriptionText
        planetCard.titleLabel.textColor  = planet.textColor
    }
}

//MARK: - UILayout
extension PlanetCell{
    private func addSubViews(){
        addView()
        addCircleView()
        addButton()
        addImageView()
    }
    
    private func addCircleView(){
        addSubview(circleView)
        circleView.centerXToSuperview()
        circleView.bottomToSuperview()
        circleView.width(80)
        circleView.height(80)
        circleView.layer.cornerRadius = 40
        
    }
    
    private func addButton(){
        circleView.addSubview(detailButton)
        detailButton.edgesToSuperview()
    }
    
    private func addView(){
        addSubview(planetCard)
        planetCard.topToSuperview().constant      = 157
        planetCard.bottomToSuperview().constant   = -50
        planetCard.leadingToSuperview().constant  = 30
        planetCard.trailingToSuperview().constant = -35
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.topToSuperview().constant = -16
        imageView.centerXToSuperview()
    }
}
