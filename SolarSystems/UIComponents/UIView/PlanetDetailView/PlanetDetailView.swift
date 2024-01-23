//
//  PlanetDetailView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 20.01.2024.
//

import UIKit

public class PlanetDetailView: UIView {

    public let imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label       = UILabel()
        label.textColor = .appDark
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
        addImageView()
        addTitle()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.leftToSuperview().constant = 10
        imageView.centerYToSuperview()
        imageView.width(100)
        imageView.height(100)
    }
    
    private func addTitle(){
        addSubview(titleLabel)
        titleLabel.leftToSuperview().constant          = 10
        titleLabel.topToBottom(of: imageView).constant = 10
    }
}
