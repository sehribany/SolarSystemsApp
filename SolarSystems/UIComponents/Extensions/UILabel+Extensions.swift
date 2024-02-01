//
//  UILabel+Extensions.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

import UIKit

extension UILabel {
    public func contentWidth() -> CGFloat {
        guard let text = self.text else { return 0 }
        let fontAttributes = [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 17.0)]
        let size = (text as NSString).size(withAttributes: fontAttributes)
        return size.width
    }
}
