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
    
    func request<Response: Decodable>(
        endPoint: EndPoint,
        body: Encodable? = nil
    ) async throws -> Response {
        guard let url = URL(string: endPoint.url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endPoint.restType.key
        endPoint.header.forEach {
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
    
    private func makeRequestBody<Body: Encodable>(data: Body) throws -> Data {
        do {
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            
            return requestBody
        } catch {
            throw NetworkError.requestEncodingError
        }
    }
    
    private func requestToResponse<Response:Decodable>(request: URLRequest) async throws -> Response {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.httpURLResponseError
        }
        
        NetworkLogger.responseLog(response: httpResponse, data: data)
        
        do {
            let decoded = try JSONDecoder().decode(BaseResponse<Response>.self, from: data)
            
            guard let data = decoded.data else {
                throw NetworkError.noData
            }
            
            guard (200...299).contains(decoded.code) else {
                throw NetworkError.serverErrorMessage(decoded.message)
            }
            
            return data
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}

