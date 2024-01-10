//
//  SegmentioOptions+Extensions.swift
//  SolarSystems
//
//  Created by Şehriban Yıldırım on 8.01.2024.
//

import Segmentio

public extension SegmentioOptions {
    
    static func options() -> SegmentioOptions {
        let indicatorOptions           = SegmentioIndicatorOptions(type: .bottom, ratio: 1, height: 2, color: Asset.Colors.appOrange1.color)
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions(type: .none, height: 0, color: .clear)
        let verticalSeparatorOptions   = SegmentioVerticalSeparatorOptions(ratio: 0, color: Asset.Colors.appOrange1.color)
        
        let segmentStates              = SegmentioStates(defaultState: SegmentioState(backgroundColor: .clear,
                                                                                      titleFont: .font(.roundedRegular, size: .large),
                                                                                      titleTextColor: Asset.Colors.appWhite.color),
                                                         selectedState: SegmentioState(backgroundColor: .clear,
                                                                                       titleFont: .font(.roundedBlack ,size: .large),
                                                                                      titleTextColor: Asset.Colors.appWhite.color),
                                                         highlightedState: SegmentioState(backgroundColor: .clear,
                                                                                    titleFont: .font(.roundedRegular, size: .medium),
                                                                                    titleTextColor: Asset.Colors.appWhite.color))
        
        let options                   = SegmentioOptions(backgroundColor: .clear,
                                                         segmentPosition: .fixed(maxVisibleItems: 3),
                                                         scrollEnabled: false,indicatorOptions: indicatorOptions,
                                                         horizontalSeparatorOptions: horizontalSeparatorOptions,
                                                         verticalSeparatorOptions: verticalSeparatorOptions,
                                                         imageContentMode: .center,
                                                         labelTextAlignment: .center,
                                                         labelTextNumberOfLines: 1,
                                                         segmentStates: segmentStates)
        return options
    }
}
