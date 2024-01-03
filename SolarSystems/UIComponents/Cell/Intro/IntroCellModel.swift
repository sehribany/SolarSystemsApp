//
//  IntroCellModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 2.01.2024.
//
import UIKit

public protocol IntroCellDataSource: AnyObject {
    var titleText       : String  {get}
    var descriptionText : String  {get}
}

public protocol IntroCellEventSource: AnyObject {}

public protocol IntroCellProtocol: IntroCellDataSource, IntroCellEventSource {}

public final class IntroCellModel: IntroCellProtocol {
    
    public var titleText       : String
    public var descriptionText : String
    
    public init(titleText: String, descriptionText: String) {
        self.titleText       = titleText
        self.descriptionText = descriptionText
    }
}
