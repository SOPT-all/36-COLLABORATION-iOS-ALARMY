//
//  Endpoint.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import Foundation

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
