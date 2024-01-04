//
//  IntroCell.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

public class IntroCell: UICollectionViewCell, ReusableView {
    
    public static var identifier: String = "IntroCell"
    
    private var imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var descriptionView: UIView = {
        let uiView                = UIView()
        uiView.backgroundColor    = Asset.Colors.appBlack.color.withAlphaComponent(0.5)
        uiView.layer.cornerRadius = 35
        uiView.layer.borderWidth  = 0.2
        uiView.layer.borderColor  = Asset.Colors.appYellow1.color.cgColor
        return uiView
    }()
    
    private var titleLabel:UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.montserratExtraBold, size: .xxLarge)
        label.textAlignment = .center
        label.textColor     = .appWhite
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.robotoBold, size: .xxLarge)
        label.textAlignment             = .center
        label.textColor                 = .appWhite
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var descriptionStackView: UIStackView = {
        let stackView     = UIStackView()
        stackView.spacing = 25
        stackView.axis    = .vertical
        return stackView
    }()
    
    weak var viewModel: IntroCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubViews()
    }
    
    public func set(viewModel: IntroCellProtocol){
        self.viewModel        = viewModel
        imageView.image       = viewModel.image
        titleLabel.text       = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
    }
}

// MARK: - UILayout
extension IntroCell{
    func addSubViews(){
        addDescriptionView()
        addImageView()
        addDescriptionStackView()
    }
    
    private func addImageView(){
        contentView.addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.topToSuperview()
        imageView.top(to: descriptionView)
    }
    
    private func addDescriptionView() {
        contentView.addSubview(descriptionView)
        descriptionView.leadingToSuperview()
        descriptionView.trailingToSuperview()
        descriptionView.bottomToSuperview()
        descriptionView.topToSuperview().constant = 140
    }
    
    private func addDescriptionStackView() {
        descriptionView.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.leadingToSuperview().constant  = 30
        descriptionStackView.trailingToSuperview().constant = -30
        descriptionStackView.topToSuperview().constant      = 150
    }
}
