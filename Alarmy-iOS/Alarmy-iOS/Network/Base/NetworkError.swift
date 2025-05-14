//
//  NetworkError.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case httpURLResponseError
    case serverError(Int)
    case responseDecodingError
    case noData
    case requestEncodingError
    case noRequestBody
}
