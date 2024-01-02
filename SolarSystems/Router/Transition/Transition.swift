//
//  Transition.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//

import UIKit

protocol Transition: AnyObject{
    var viewController: UIViewController? { get set }
    func open(_ viewController : UIViewController)
    func close(_ viewController: UIViewController)
}
