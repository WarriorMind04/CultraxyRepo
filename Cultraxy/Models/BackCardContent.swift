//
//  BackCardContent.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation
struct BackCardContent: Identifiable, Codable {
    let id = UUID()
    let type: BackCardType
    let title: String
    let text: String
}
