//
//  DiscoveryViewController.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import UIKit

final class DiscoveryViewController: BaseViewController<DiscoveryViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.appPink1.cgColor, UIColor.appPurple1.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
}
