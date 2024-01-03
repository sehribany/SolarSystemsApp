//
//  UIFont+Extensions.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

public extension UIFont{
    
    enum FontWeight{
        case montserratExtraLight
        case montserratExtraBold
        case montserratLight
        case robotoRegular
        case robotoBold
    }
    
    enum FontSize {
        /// 11
        case xSmall
        
        /// 12
        case small
        
        /// 13
        case medium
        
        /// 14
        case large
        
        /// 15
        case xLarge
        
        /// 16
        case xxLarge
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .xSmall          : return 11
            case .small           : return 12
            case .medium          : return 13
            case .large           : return 14
            case .xLarge          : return 15
            case .xxLarge         : return 16
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont{
        let font: UIFont
        switch weight{
            
        case .montserratExtraLight:
            font = FontFamily.Montserrat.extraLight.font(size: size.rawValue)
        case .montserratExtraBold:
            font = FontFamily.Montserrat.extraBold.font(size: size.rawValue)
        case .montserratLight:
            font = FontFamily.Montserrat.light.font(size: size.rawValue)
        case .robotoRegular:
            font = FontFamily.Roboto.regular.font(size: size.rawValue)
        case .robotoBold:
            font = FontFamily.Roboto.bold.font(size: size.rawValue)
        }
        return font
    }
}

