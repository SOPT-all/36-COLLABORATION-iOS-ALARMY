//
//  AlarmSettingResponse.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/22/25.
//

import Foundation

struct AlarmSettingRequest: Encodable {
    let timestamp: String
}

struct AlarmSettingResponse: Decodable {
    let id: Int
    let timestamp: String
    let isActive: Bool
}
