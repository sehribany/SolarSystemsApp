//
//  PlanetCellModel.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 5.01.2024.
//
import UIKit

public protocol PlanetCellDataSource: AnyObject {
    var image           : UIImage {get}
    var titleText       : String  {get}
    var descriptionText : String  {get}
    var textColor       : UIColor {get}
}

public protocol PlanetCellEventSource: AnyObject {}

public protocol PlanetCellProtocol: PlanetCellDataSource, PlanetCellEventSource {}

public final class PlanetCellModel: PlanetCellProtocol {
    public var image           : UIImage
    public var titleText       : String
    public var descriptionText : String
    public var textColor       : UIColor
    
    public init(image: UIImage, titleText: String, descriptionText: String, textColor: UIColor) {
        self.image           = image
        self.titleText       = titleText
        self.descriptionText = descriptionText
        self.textColor       = textColor
    }
}
