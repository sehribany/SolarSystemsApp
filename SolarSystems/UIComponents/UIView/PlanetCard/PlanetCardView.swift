//
//  PlanetCardView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 6.01.2024.
//

import UIKit

class PlanetCardView: UIView {
        
    public let titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.montserratExtraBold, size: .custom(size: 26))
        label.textAlignment = .left
        return label
    }()
    
    public var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.montserratLight, size: .large)
        label.textAlignment             = .left
        label.textColor                 = .appWhite
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
    }
}

//MARK: - UILayout
extension PlanetCardView{
    
    private func addSubViews(){
        addTitleLabel()
        addDescriptionLabel()
    }
    
    private func addTitleLabel(){
        addSubview(titleLabel)
        titleLabel.leftToSuperview().constant = 20
        titleLabel.topToSuperview().constant  = 54
    }

    private func addDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.leftToSuperview().constant           = 20
        descriptionLabel.trailingToSuperview().constant       = -20
        descriptionLabel.topToBottom(of: titleLabel).constant = 6
    }
}

// MARK: - Configure and Set Localize
extension PlanetCardView {
    private func configureContents(){
        backgroundColor    = .clear
        layer.borderWidth  = 0.5
        layer.borderColor  = Asset.Colors.appGray.color.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 30
    }
}

