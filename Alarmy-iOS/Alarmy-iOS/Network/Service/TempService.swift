//
//  TempService.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/9/25.
//

import Foundation

protocol TempServiceProtocol {
    func getTest() async throws -> String
    func postTest(id: Int) async throws -> String
}

final class DefaultTempService: TempServiceProtocol {
    private let network = BaseService.shared
    
    func getTest() async throws -> String {
        do {
            let response: TempModelResponse = try await network.request(endPoint: .fetch)
            
            return response.name
        } catch {
            // 에러일 때 행동 정의
            print("get 실패 ~")
            return ""
        }
    }
    
    func postTest(id: Int) async throws -> String {
        do {
            let request = TempModelRequest(id: id)
            let response: TempModelResponse = try await network.request(
                endPoint: .login,
                body: request
            )
        
            return response.name
        } catch {
            // 에러일 때 행동 정의
            print("post 실패 ~")
            return ""
        }
    }
}
