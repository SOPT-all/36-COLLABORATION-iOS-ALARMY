//
//  BaseService.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

final class BaseService {
    static let shared = BaseService()
    private init() { }
    
    func request<T: Decodable>(
        endpoint: Endpoint,
        body: Encodable? = nil
    ) async throws -> T {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.restType.key
        endpoint.header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body {
            let requestBody = try makeRequestBody(data: body)
            request.httpBody = requestBody
        }
        
        NetworkLogger.requestLog(request: request)
        
        return try await requestToResponse(request: request)
    }

    // MARK: - private functions
    
    private func makeRequestBody(data: Encodable?) throws -> Data {
        do {
            guard let data else { throw NetworkError.noRequestBody }
            
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            
            return requestBody
        } catch {
            throw NetworkError.requestEncodingError
        }
    }
    
    private func requestToResponse<T:Decodable>(request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.httpURLResponseError
        }
        
        NetworkLogger.responseLog(response: httpResponse, data: data)
        
        // TODO: 명세 따라서 에러코드 분류하기
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(BaseResponse<T>.self, from: data)
            
            guard let data = decoded.data else {
                throw NetworkError.noData
            }
            
            return data
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}

