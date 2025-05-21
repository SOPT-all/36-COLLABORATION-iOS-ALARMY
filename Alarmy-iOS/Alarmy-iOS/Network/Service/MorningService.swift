//
//  MorningService.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/21/25.
//

import Foundation

protocol MorningProtocol {
    func fetchWeather() async throws -> WeatherEntity
    func fetchQuote() async throws -> Int
}

struct DefaultMorningService: MorningProtocol {
    private let network = BaseService.shared
    
    func fetchWeather() async throws -> WeatherEntity {
        do {
            let response: WeatherResponse = try await network.request(endPoint: .fetchWeather)
            
            return response.toEntity()
        } catch {
            return .mock()
        }
    }
    
    func fetchQuote() async throws -> Int {
        do {
            let response: QuoteResponse = try await network.request(endPoint: .fetchQuote)
            
            return response.imageNum
        } catch {
            return 1
        }
    }
}

struct MockMorningService: MorningProtocol {
    func fetchWeather() async throws -> WeatherEntity {
        return .mock()
    }
    
    func fetchQuote() async throws -> Int {
        return 1
    }
}
