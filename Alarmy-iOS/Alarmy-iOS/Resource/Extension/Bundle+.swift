//
//  Bundle+.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/21/25.
//

import Foundation

extension Bundle {
    var baseURL: String {
        guard let result = infoDictionary?["BaseURL"] as? String else {
            fatalError("BASE_URL not found in Info.plist")
        }
        
        return result
    }
}
