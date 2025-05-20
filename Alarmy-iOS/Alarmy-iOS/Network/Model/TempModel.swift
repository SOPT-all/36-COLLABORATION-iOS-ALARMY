//
//  TempModel.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/9/25.
//

import Foundation

struct TempModelRequest: Encodable {
    let id: Int
}

struct TempModelResponse: Decodable {
    let name: String
}
