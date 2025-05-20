//
//  AlarmModel.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/16/25.
//

import UIKit

struct AlarmModel {
    let ampmLabel: String
    let timeLabel: String
}

extension AlarmModel {
    static func dummy() -> [AlarmModel] {
        return [
            AlarmModel(ampmLabel: "오전", timeLabel: "7:20"),
            AlarmModel(ampmLabel: "오전", timeLabel: "7:55"),
            AlarmModel(ampmLabel: "오전", timeLabel: "8:10"),
            AlarmModel(ampmLabel: "오전", timeLabel: "9:00"),
            AlarmModel(ampmLabel: "오후", timeLabel: "10:30")
        ]
    }
}
