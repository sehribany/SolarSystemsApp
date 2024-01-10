//
//  CelestialBodiesViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import UIKit

final class CelestialBodiesViewController: BaseViewController<CelestialBodiesViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundDraw()
    }
    
    private func backgroundDraw(){
        let gradientLayer    = CAGradientLayer()
        gradientLayer.frame  = view.bounds
        gradientLayer.colors = [UIColor.appYellow1.cgColor, UIColor.appPurple1.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
