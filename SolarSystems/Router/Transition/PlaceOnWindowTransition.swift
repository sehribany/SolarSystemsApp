//
//  PlaceOnWindowTransition.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

class PlaceOnWindowTransition: Transition {
    
    var viewController: UIViewController?
    
    func open(_ viewController: UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation {
                window.rootViewController = viewController
            }
        }, completion: nil)
    }
    func close(_ viewController: UIViewController) {}
}
