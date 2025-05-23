//
//  Endpoint.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import Foundation

enum EndPoint {
    case fetchWeather
    case fetchQuote
    case createAlarm
    // post 예시
    case login
    case alarms
    
    var restType: HTTPMethodType {
        switch self {
        case .fetchWeather, .fetchQuote, .alarms:
            return .get
        case .createAlarm, .login:
            return .post
        }
    }
    
    var url: String {
        switch self {
        case .fetchWeather:
            return "/api/v1/weather"
        case .fetchQuote:
            return "/api/v1/phrase"
        case .createAlarm:
            return "/api/v1/alarm"
        case .login:
            return ""
        case .alarms:
            return "/api/v1/alarms"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .fetchWeather:
            HeaderType.none.value
        case .fetchQuote, .createAlarm, .alarms, .login:
            HeaderType.auth.value
        }
    }
}
