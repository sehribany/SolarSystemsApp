//
//  DiscoveryCell.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 27.01.2024.
//

import UIKit
import SceneKit

public class DiscoveryCell: UICollectionViewCell, ReusableView {
    public static var identifier: String = "DiscoveryCell"
    
    private let ARView = DiscoveryCardAR()
    
    weak var viewModel: DiscoveryCellProtocol?
    
    public func set(viewModel: DiscoveryCellProtocol) {
        self.viewModel = viewModel
        let discoveryCardAR = DiscoveryCardAR(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        discoveryCardAR.setupAR()

        // AR öğelerini eklemek için gereken işlemleri yapabilirsiniz.
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        discoveryCardAR.addNodeToARScene(node: cubeNode)
        //newsCard.set(viewModel: NewsCardViewModel(article: viewModel.article))
    }
    
}
