//
//  PracticeScenario.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import Foundation

struct PracticeScenario: Codable {
    let practiceId: String
    let scenario: String
    let idiom: String
    let sourceLanguage: String
    let targetLanguage: String
    
    enum CodingKeys: String, CodingKey {
        case practiceId = "practice_id"
        case scenario
        case idiom
        case sourceLanguage = "source_language"
        case targetLanguage = "target_language"
    }
}
