//
//  funfact.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

struct FunFactModel: Codable, Identifiable {
    let id: Int
    let text: String
    let culture: String
    let source: String
}
