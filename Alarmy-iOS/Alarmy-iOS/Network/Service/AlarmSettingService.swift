//
//  AlarmSettingService.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/22/25.
//

import Foundation

protocol AlarmSettingProtocol {
    func createAlarm(timestamp: String) async throws
}

struct DefaultAlarmSettingService: AlarmSettingProtocol {
    private let network = BaseService.shared
    
    func createAlarm(timestamp: String) async throws {
        do {
            let request = AlarmSettingRequest(timestamp: timestamp)
            let response: [AlarmSettingResponse] = try await network.request(
                endPoint: .createAlarm,
                body: request
            )
            
            print(response)
            print(request)
        } catch {
            print("post 실패: \(error)")
        }
    }
}
