//
//  AlarmService.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/22/25.
//

import Foundation

protocol FetchAlarmProtocol {
    func fetchAlarmList() async throws -> [AlarmEntity]
}

struct DefaultFetchAlarmService: FetchAlarmProtocol {
    private let network = BaseService.shared
    
    func fetchAlarmList() async throws -> [AlarmEntity] {
        do {
            let response: [AlarmResponse] = try await network.request(endPoint: .alarms)
            return response.map { $0.toEntity() }
        } catch {
            print("통신 실패: \(error)")
            return [.mock()]
        }
    }
}
