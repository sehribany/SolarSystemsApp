//
//  ImageCardView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 24.01.2024.
//

import UIKit

public class ImageCardView: UIView {

    public let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Asset.Icons.icBack.image, for: .normal)
        return button
    }()
    
    public let imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appDark
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayout
extension ImageCardView{
    private func addSubViews(){
        addButton()
        addImageView()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.centerYToSuperview()
        imageView.width(300)
        imageView.height(238)
    }
    
    private func addButton(){
        addSubview(backButton)
        backButton.leadingToSuperview().constant = 20
        backButton.topToSuperview().constant     = 35
    }
}
