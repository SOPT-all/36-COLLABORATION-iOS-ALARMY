//
//  RestAPIType.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/13/25.
//


import Foundation

enum RestAPIType {
    case get
    case post
    
    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        }
    }
}

enum Endpoint {
    // get 예시
    case fetch
    // post 예시
    case login
    
    var restType: RestAPIType {
        switch self {
        case .fetch:
            return .get
        case .login:
            return .post
        }
    }
    
    var url: String {
        switch self {
        case .fetch:
            return ""
        case .login:
            return ""
        }
    }
}
