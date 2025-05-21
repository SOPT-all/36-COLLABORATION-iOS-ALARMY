//
//  HTTPMethodType.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/13/25.
//


import Foundation

enum HTTPMethodType {
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
                "userId": "6"
            ]
        case .none:
            ["Content-Type": "application/json"]
        }
    }
}
