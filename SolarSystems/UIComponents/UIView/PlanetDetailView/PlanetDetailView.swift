//
//  PlanetDetailView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 20.01.2024.
//

import UIKit

public class PlanetDetailView: UIView {
    
    public let cardView = ImageCardView()
    
    public let backGround: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.montserratExtraBold, size: .custom(size: 25))
        label.textAlignment = .left
        label.textColor     = .appWhite
        return label
    }()
    
    private let massTitle: UILabel = {
        let label = UILabel()
        label.text = "Mass"
        label.font = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor = .appGray
        return label
    }()

    private let massValueTitle: UILabel = {
        let label = UILabel()
        label.text = "5.97237 kg"
        label.font = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor = .appWhite
        return label
    }()

    private let meanTempTitle: UILabel = {
        let label = UILabel()
        label.text = "Mean Temp"
        label.font          = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor     = .appGray
        return label
    }()

    private let meanTempValueTitle: UILabel = {
        let label = UILabel()
        label.text = "288 K"
        label.font          = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor     = .appWhite
        return label
    }()
    
    private let moonsTitle: UILabel = {
        let label = UILabel()
        label.text = "Moons"
        label.font          = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor     = .appGray
        return label
    }()

    public let moonsValueTitle: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font          = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor     = .appWhite
        return label
    }()

    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font          = UIFont.font(.montserratLight, size: .custom(size: 17))
        label.textAlignment = .left
        label.textColor     = .appGray
        label.numberOfLines  = 0
        return label
    }()
    
    weak var viewModel: PlanetDetailViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

//MARK: - UILayout
extension PlanetDetailView{
    private func addSubViews(){
        addBackGround()
        addImageCard()
        addTitle()
        addTitleandValue()
        addLine()
        addDescriptionLabel()
    }
    
    private func addBackGround(){
        addSubview(backGround)
        backGround.edgesToSuperview()
    }
    
    private func addImageCard(){
        addSubview(cardView)
        cardView.leadingToSuperview()
        cardView.trailingToSuperview()
        cardView.topToSuperview()
        cardView.bottomToSuperview().constant = -500
    }
    
    private func addTitle(){
        addSubview(titleLabel)
        titleLabel.leftToSuperview().constant          = 10
        titleLabel.topToBottom(of: cardView).constant  = 5
    }
    
    private func addTitleandValue(){

        addSubview(massTitle)
        addSubview(massValueTitle)

        addSubview(meanTempTitle)
        addSubview(meanTempValueTitle)
        
        addSubview(moonsTitle)
        addSubview(moonsValueTitle)
        
        massTitle.topToBottom(of: titleLabel).constant     = 20
        massTitle.leadingToSuperview().constant            = 10
        massValueTitle.leadingToSuperview().constant       = 10
        massValueTitle.topToBottom(of: massTitle).constant = 5
        
        
        meanTempTitle.topToBottom(of: titleLabel).constant                = 20
        meanTempTitle.leadingToTrailing(of: massValueTitle).constant      = 50
        meanTempValueTitle.topToBottom(of: meanTempTitle).constant        = 5
        meanTempValueTitle.leadingToTrailing(of: massValueTitle).constant = 50

        moonsTitle.topToBottom(of: titleLabel).constant                    = 20
        moonsTitle.leadingToTrailing(of: meanTempValueTitle).constant      = 100
        moonsValueTitle.topToBottom(of: moonsTitle).constant               = 5
        moonsValueTitle.leadingToTrailing(of: meanTempValueTitle).constant = 100
    }
    
    private func addLine(){
        let verticalLine1 = UIView()
        let verticalLine2 = UIView()
        verticalLine1.backgroundColor = .appGray
        verticalLine2.backgroundColor = .appGray
        addSubview(verticalLine1)
        addSubview(verticalLine2)
        verticalLine1.width(1)
        verticalLine1.height(50)
        verticalLine2.width(1)
        verticalLine2.height(50)
        verticalLine1.topToBottom(of: titleLabel).constant           = 20
        verticalLine1.leadingToTrailing(of: massValueTitle).constant = 25
        verticalLine2.topToBottom(of: titleLabel).constant           = 20
        verticalLine2.leadingToTrailing(of: meanTempTitle).constant  = 25
    }
    
    private func addDescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: massValueTitle).constant = 25
        descriptionLabel.leadingToSuperview().constant            = 10
        descriptionLabel.trailingToSuperview().constant           = -10
    }
}
