//
//  MainTabBar.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import UIKit

class MainTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        let ovalRect = CGRect(x: 20, y: -15, width: bounds.width - 40, height: 70)
        let maskPath = UIBezierPath(roundedRect: ovalRect, cornerRadius: 35).cgPath

        let maskLayer  = CAShapeLayer()
        maskLayer.path = maskPath
        layer.mask     = maskLayer

        let shapeLayer         = CAShapeLayer()
        shapeLayer.path        = maskPath
        shapeLayer.strokeColor = Asset.Colors.appWhite.color.cgColor
        shapeLayer.fillColor   = Asset.Colors.appWhite.color.cgColor


        if let sublayers = layer.sublayers, sublayers.contains(shapeLayer) {
            shapeLayer.removeFromSuperlayer()
        }
        layer.insertSublayer(shapeLayer, at: 0)
    }
}
