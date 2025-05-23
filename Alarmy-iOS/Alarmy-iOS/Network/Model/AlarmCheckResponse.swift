//
//  AlarmCheckResponse.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/23/25.
//

import Foundation

struct AlarmCheckResponse: Decodable {
    let alarmInfo: [AlarmTriggerInfo]
}

struct AlarmTriggerInfo: Decodable {
    let id: Int
    let shouldTrigger: Bool
}
