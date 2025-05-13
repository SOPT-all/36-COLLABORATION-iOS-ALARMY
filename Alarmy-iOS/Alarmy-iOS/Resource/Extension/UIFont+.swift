//
//  UIFont+.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/10/25.
//

import UIKit

extension UIFont {
    enum Pretendard: String {
        case bold = "Pretendard-Bold" // 700
        case semiBold = "Pretendard-SemiBold" // 600
        case medium = "Pretendard-Medium" // 500
        case regular = "Pretendard-Regular" // 400
    }
    
    static func pretendard(weight: Pretendard, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static let title1 = UIFont.pretendard(weight: .bold, size: 88)
    static let title2 = UIFont.pretendard(weight: .bold, size: 40)
    static let title3 = UIFont.pretendard(weight: .bold, size: 24)
    static let title4 = UIFont.pretendard(weight: .semiBold, size: 32)
    static let title5 = UIFont.pretendard(weight: .semiBold, size: 20)
    static let title6 = UIFont.pretendard(weight: .semiBold, size: 18)
    static let title7 = UIFont.pretendard(weight: .regular, size: 26)
    static let title8 = UIFont.pretendard(weight: .regular, size: 24)
    static let title9 = UIFont.pretendard(weight: .regular, size: 22)
    static let title10 = UIFont.pretendard(weight: .regular, size: 18)
    
    static let body1 = UIFont.pretendard(weight: .semiBold, size: 16)
    static let body2 = UIFont.pretendard(weight: .semiBold, size: 14)
    static let body3 = UIFont.pretendard(weight: .semiBold, size: 12)
    static let body4 = UIFont.pretendard(weight: .medium, size: 12)
    static let body5 = UIFont.pretendard(weight: .regular, size: 16)
    static let body6 = UIFont.pretendard(weight: .regular, size: 15)
    static let body7 = UIFont.pretendard(weight: .regular, size: 14)
    
    static let caption1 = UIFont.pretendard(weight: .regular, size: 12)
    static let caption2 = UIFont.pretendard(weight: .regular, size: 10)
}
