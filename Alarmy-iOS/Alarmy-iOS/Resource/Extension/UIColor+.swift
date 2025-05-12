//
//  UIColor+.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/12/25.
//

import UIKit

enum SceneColorAsset {
    case redPrimary, redPrimaryClick, redSecondary, redThird
    case bluePrimary, blueSecondary, blueThird, bluePrimaryOpacity
    case cloud, rain, sun1, sun2
    case wGrey300, wGrey400
    case grey100, grey200, grey300, grey400, grey500, grey600, grey700, grey800, grey900, grey950
    case greyOpacity200, greyOpacity900
    case white, black
}

extension UIColor {
    static func setColor(_ hexCode: String) -> UIColor {
        return UIColor(hexCode: hexCode)
    }
    
    static func appColor(_ name: SceneColorAsset) -> UIColor {
        switch name {
        case .redPrimary:
            return UIColor(hexCode: "FA314B")
        case .redPrimaryClick:
            return UIColor(hexCode: "FC5A70")
        case .redSecondary:
            return UIColor(hexCode: "E4A3AF")
        case .redThird:
            return UIColor(hexCode: "A12434")
        case .bluePrimary:
            return UIColor(hexCode: "13AAC9")
        case .blueSecondary:
            return UIColor(hexCode: "233F4C")
        case .blueThird:
            return UIColor(hexCode: "4CCFF3")
        case .bluePrimaryOpacity:
            return UIColor(hexCode: "13AAC9").withAlphaComponent(0.2)
        case .cloud:
            return UIColor(hexCode: "BDCFED")
        case .rain:
            return UIColor(hexCode: "747E8F")
        case .sun1:
            return UIColor(hexCode: "F1BA02")
        case .sun2:
            return UIColor(hexCode: "F7DC81")
        case .grey100:
            return UIColor(hexCode: "F7FAFF")
        case .grey200:
            return UIColor(hexCode: "D4D7E0")
        case .grey300:
            return UIColor(hexCode: "BFC2CB")
        case .grey400:
            return UIColor(hexCode: "9BA3B2")
        case .grey500:
            return UIColor(hexCode: "757B8B")
        case .grey600:
            return UIColor(hexCode: "484C57")
        case .grey700:
            return UIColor(hexCode: "2C2E36")
        case .grey800:
            return UIColor(hexCode: "2B2F38")
        case .grey900:
            return UIColor(hexCode: "1C1F26")
        case .grey950:
            return UIColor(hexCode: "131418")
        case .greyOpacity200:
            return UIColor(hexCode: "D4D7E0").withAlphaComponent(0.1)
        case .greyOpacity900:
            return UIColor(hexCode: "1C1F26").withAlphaComponent(0.3)
        case .white:
            return UIColor(hexCode: "FFFFFF")
        case .black:
            return UIColor(hexCode: "000000")
        case .wGrey300:
            return UIColor(hexCode: "8E8F92")
        case .wGrey400:
            return UIColor(hexCode: "686A71")
        }
    }
}

extension UIColor {
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hexCode)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
