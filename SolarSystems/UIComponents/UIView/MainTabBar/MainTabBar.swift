//
//  MainTabBar.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 4.01.2024.
//

import UIKit

class MainTabBar: UITabBar {

    private var shapeLayer: CALayer?
        private var selectedTabIndex: Int = 1
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            layoutSubviews()
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            guard let selectedItem = selectedItem else { return }
            
            if let itemIndex = tabBarItemsIndex(for: selectedItem), selectedTabIndex != itemIndex {
                selectedTabIndex = itemIndex
                updateSelectedTab()
            }
        }

        private func updateSelectedTab() {
            guard let selectedItem = selectedItem else { return }
            guard let index = tabBarItemsIndex(for: selectedItem) else { return }

            let itemWidth = frame.width / CGFloat(items?.count ?? 1)
            let xPosition = itemWidth * CGFloat(index)

            shapeLayer?.removeFromSuperlayer()

            let selectedTabRect = CGRect(x: xPosition, y: 0, width: itemWidth, height: 2)
            let selectedTabLayer = CALayer()
            selectedTabLayer.frame = selectedTabRect
            selectedTabLayer.backgroundColor = Asset.Colors.appMars.color.cgColor

            layer.addSublayer(selectedTabLayer)
            shapeLayer = selectedTabLayer
        }

        private func tabBarItemsIndex(for item: UITabBarItem) -> Int? {
            guard let items = items else { return nil }
            return items.firstIndex(of: item)
        }
}
