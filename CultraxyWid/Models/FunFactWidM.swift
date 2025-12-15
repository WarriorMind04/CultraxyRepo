//
//  FunFact.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import Foundation
struct FunFactWidgetModel: Codable, Identifiable {
    let id: Int
    let text: String
    let culture: String
    let source: String
}


extension FunFactWidgetModel {
    static let placeholder = FunFactWidgetModel(
        id: 0,                      // usar un Int
        text: "I am Groot.",         // usar la propiedad correcta
        culture: "Placeholder",      // agregar algo para culture
        source: "Placeholder"        // agregar algo para source
    )
}
