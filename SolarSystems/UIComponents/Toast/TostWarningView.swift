//
//  TostWarningView.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit
import TinyConstraints

class ToastWarningView: UIView {
    
    private var label: UILabel{
        let label           = UILabel()
        label.font          = UIFont.font(.robotoBold, size: .large)
        label.textColor     = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }

    init(text: String) {
        super.init(frame: .zero)
        label.text = text
        label.sizeToFit()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContents() {
        addSubview(label)
        label.topToSuperview()
        label.bottomToSuperview()
        label.leadingToSuperview(offset: 55)
        label.trailingToSuperview(offset: -55)
    }
}
