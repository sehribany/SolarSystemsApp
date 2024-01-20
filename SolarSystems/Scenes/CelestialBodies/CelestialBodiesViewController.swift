//
//  CelestialBodiesViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import UIKit

final class CelestialBodiesViewController: BaseViewController<CelestialBodiesViewModel> {
    
    private let backGround: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundDraw()
    }
    
    private func backgroundDraw(){
        view.addSubview(backGround)
        backGround.image = Asset.Images.homeScreen.image
        backGround.edgesToSuperview()
    }
}
