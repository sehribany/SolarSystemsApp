//
//  ToastPresenter.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes               = EKAttributes.topToast
        attributes.entryBackground   = .color(color: EKColor(light: .appBlack, dark: .appBlack))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation     = .translation

        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
