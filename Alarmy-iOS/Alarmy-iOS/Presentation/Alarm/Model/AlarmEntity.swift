//
//  AlarmEntity.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/22/25.
//

import Foundation

struct AlarmEntity {
    let id: Int
    let timestamp: String
    var isActive: Bool
}

extension AlarmEntity {
    static func mock() -> AlarmEntity {
        return .init(id: 1, timestamp: "00:00", isActive: true)
    }
}
