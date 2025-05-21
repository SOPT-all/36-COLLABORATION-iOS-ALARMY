//
//  WeatherEntity.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/21/25.
//

import SwiftUI

struct WeatherEntity {
    let temperature: Int
    let code: Int
}

extension WeatherEntity {
    static func mock() -> WeatherEntity {
        return .init(temperature: 17, code: 1)
    }
}
