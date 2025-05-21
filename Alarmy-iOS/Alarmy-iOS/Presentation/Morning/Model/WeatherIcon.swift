//
//  WeatherIcon.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/21/25.
//

import UIKit

enum WeatherIcon: Int {
    case sunny = 1
    case rainy
    case cloudy
    
    var resource: ImageResource {
        switch self {
        case .sunny:
            return .iconMorningSun
        case .rainy:
            return .iconMorningRain
        case .cloudy:
            return .iconMorningCloud
        }
    }
    
    static func codeToImage(_ code: Int) -> ImageResource {
        guard let icon = WeatherIcon(rawValue: code) else {
            return .iconMorningSun
        }
        
        return icon.resource
    }
}
