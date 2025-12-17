//
//  IdiomPracticeViewModel.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import Foundation
//import Combine

@Observable
class IdiomPracticeViewModel {
    var currentScenario: PracticeScenario?
    var userAnswer: String = ""
    var evaluation: PracticeEvaluation?
    var isLoading: Bool = false
    var showingEvaluation: Bool = false
    var errorMessage: String?
    
    private let apiService = GemAPIService()
    
    func loadNewPractice(sourceLanguage: String, targetLanguage: String, targetCulture: String) {
        isLoading = true
        errorMessage = nil
        showingEvaluation = false
        userAnswer = ""
        evaluation = nil
        
        apiService.generatePractice(
            sourceLanguage: sourceLanguage,
            targetLanguage: targetLanguage,
            targetCulture: targetCulture
        ) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let scenario):
                self.currentScenario = scenario
                print("✅ Practice loaded: \(scenario.idiom)")
            case .failure(let error):
                self.errorMessage = "Error loading practice: \(error.localizedDescription)"
                print("❌ Error:", error)
            }
        }
    }
    
    func checkAnswer() {
        guard let scenario = currentScenario, !userAnswer.isEmpty else { return }
        
        isLoading = true
        
        apiService.evaluateAnswer(
            practiceId: scenario.practiceId,
            userAnswer: userAnswer,
            idiom: scenario.idiom,
            sourceLanguage: scenario.sourceLanguage,
            targetLanguage: scenario.targetLanguage
        ) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let evaluation):
                self.evaluation = evaluation
                self.showingEvaluation = true
                print("✅ Answer evaluated: \(evaluation.isCorrect ? "Correct" : "Incorrect")")
            case .failure(let error):
                self.errorMessage = "Error evaluating answer: \(error.localizedDescription)"
                print("❌ Error:", error)
            }
        }
    }
    
    func getHint() -> String {
        return "Think about the literal meaning and how it would be expressed naturally in the target language."
    }
}
