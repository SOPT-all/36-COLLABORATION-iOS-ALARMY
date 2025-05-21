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
    // post 예시
    case login
    
    var restType: HTTPMethodType {
        switch self {
        case .fetchWeather, .fetchQuote:
            return .get
        case .login:
            return .post
        }
    }
    
    var url: String {
        switch self {
        case .fetchWeather:
            return "/api/v1/weather"
        case .fetchQuote:
            return "/api/v1/phrase"
        case .login:
            return ""
        }
    }
    
    var header: [String: String] {
        switch self {
        case .fetchWeather:
            HeaderType.none.value
        case .fetchQuote, .login:
            HeaderType.auth.value
        }
    }
}
