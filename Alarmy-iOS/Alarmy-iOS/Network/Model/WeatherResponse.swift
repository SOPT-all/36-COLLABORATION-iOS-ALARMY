//
//  WeatherModel.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/21/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let date: String
    let temperature: Int
    let weatherCode: Int
}

extension WeatherResponse {
    func toEntity() -> WeatherEntity {
        .init(temperature: temperature, code: weatherCode)
    }
}

