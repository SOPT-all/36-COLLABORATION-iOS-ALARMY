//
//  AlarmResponse.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/16/25.
//

import UIKit

struct AlarmResponse: Decodable {
    let id: Int
    let timestamp: String
    let isActive: Bool
}

extension AlarmResponse {
    func toEntity() -> AlarmEntity {
        .init(timestamp: timestamp, isActive: isActive)
    }
}
