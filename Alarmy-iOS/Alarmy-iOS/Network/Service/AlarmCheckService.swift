//
//  AlarmCheckService.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/23/25.
//

import Foundation

protocol AlarmCheckServiceProtocol {
    func fetchAlarmCheck(currentTime: String) async throws -> String
}

final class DefaultAlarmCheckService: AlarmCheckServiceProtocol {
    private let network = BaseService.shared
    
    func fetchAlarmCheck(currentTime: String) async throws -> String {
        do {
            let response: AlarmCheckResponse = try await network.request(
                endPoint: .alarmCheck(currentTime: currentTime)
            )

            let shouldTriggerID = response.alarmInfo
                .filter { $0.shouldTrigger }
                .map { String($0.id) }
                .joined(separator: ", ")

            return shouldTriggerID
        } catch {
            print("get 실패 ~")
            return ""
        }
    }
}
