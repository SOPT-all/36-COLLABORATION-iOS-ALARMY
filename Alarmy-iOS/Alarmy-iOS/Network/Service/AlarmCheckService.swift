//
//  AlarmCheckService.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/23/25.
//

import Foundation

protocol AlarmCheckServiceProtocol {
    func fetchAlarmCheck(currentTime: String) async throws -> [Int]
}

final class DefaultAlarmCheckService: AlarmCheckServiceProtocol {
    private let network = BaseService.shared
    
    func fetchAlarmCheck(currentTime: String) async throws -> [Int] {
        do {
            let response: AlarmCheckResponse = try await network.request(
                endPoint: .alarmCheck(currentTime: currentTime)
            )

            let triggeredIDs = response.alarmInfo
                .filter { $0.shouldTrigger }
                .map { $0.id }

            return triggeredIDs
        } catch {
            print("get 실패 ~")
            return []
        }
    }
}
