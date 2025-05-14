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

enum HeaderType {
    case auth
    case none
    
    var value: [String: String] {
        switch self {
        case .auth:
            [
                "Content-Type": "application/json",
                // userID로 대체
                "Authorization": "1"
            ]
        case .none:
            ["Content-Type": "application/json"]
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
    
    var header: [String: String] {
        switch self {
        case .fetch:
            HeaderType.none.value
        case .login:
            HeaderType.auth.value
        }
    }
}
