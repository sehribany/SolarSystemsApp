//
//  UIImage+Extensions.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import Kingfisher

public extension UIImage {
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
}
