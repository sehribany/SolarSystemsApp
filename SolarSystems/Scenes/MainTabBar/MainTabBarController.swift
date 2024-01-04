//
//  MainTabBarController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.12.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.appPink1.cgColor, UIColor.appPink2.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
