//
//  IntroCell.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

public class IntroCell: UICollectionViewCell, ReusableView {
    
    public static var identifier: String = "IntroCell"
    
    private var descriptionView: UIView = {
        let uiView                 = UIView()
        uiView.backgroundColor     = Asset.Colors.appBlack.color.withAlphaComponent(0.5)
        uiView.layer.cornerRadius  = 35
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
        titleLabel.text       = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
    }
}

// MARK: - UILayout
extension IntroCell{
    func addSubViews(){
        addDescriptionView()
        addDescriptionStackView()
    }
    
    private func addDescriptionView() {
        contentView.addSubview(descriptionView)
        descriptionView.top(to: contentView)
        descriptionView.edgesToSuperview(excluding: .top)
    }
    
    private func addDescriptionStackView() {
        descriptionView.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.leadingToSuperview().constant  = 30
        descriptionStackView.trailingToSuperview().constant = -30
        descriptionStackView.topToSuperview().constant      = 200
    }
}
