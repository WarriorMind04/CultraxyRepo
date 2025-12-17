//
//  PracticeEvaluation.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import Foundation

struct PracticeEvaluation: Codable {
    let isCorrect: Bool
    let feedback: String
    let correctAnswer: String
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case isCorrect = "is_correct"
        case feedback
        case correctAnswer = "correct_answer"
        case score
    }
}
