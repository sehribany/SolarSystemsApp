//
//  Animator.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning{
    var isPresenting: Bool {get set}
}
