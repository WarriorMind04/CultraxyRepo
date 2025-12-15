//
//  FunFactContainer.swift
//  GrootWidgetExtension
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import Foundation
struct FunFactContainer: Codable {
    let funFacts: [FunFactWidgetModel]
    enum CodingKeys: String, CodingKey {
            case funFacts = "fun_facts" // coincide con tu JSON
        }
}
