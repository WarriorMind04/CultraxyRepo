//
//  NetworkError.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case encodingError
    case decodingError(Error)
    // Add custom errors for status codes if needed
}
