//
//  TranslatorViewModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//


import Foundation
import Combine

class TranslatorViewModel: ObservableObject {

    let apiService = GemAPIService()

    @Published var selectedLanguage: Language = .english

    @Published var literalTranslation = ""
    @Published var actualMeaning = ""
    @Published var equivalent = ""
    @Published var context = ""
    @Published var isLoading = false

    func getExplanation(for idiom: String) {
        guard !idiom.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        isLoading = true

        apiService.explainIdiom(
            idiom: idiom,
            languageCode: selectedLanguage.code
        ) { result in
            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                case .success(let response):
                    self.parseGeminiResponse(response.explanation)

                case .failure(let error):
                    self.literalTranslation = "Error"
                    self.actualMeaning = error.localizedDescription
                    self.equivalent = "Error"
                    self.context = "Error"
                }
            }
        }
    }

    private func parseGeminiResponse(_ text: String) {
        literalTranslation = extractSection(from: text, sectionName: "Literal Translation")
        actualMeaning = extractSection(from: text, sectionName: "Actual Meaning")
        equivalent = extractSection(from: text, sectionName: "Equivalent")
        context = extractSection(from: text, sectionName: "Context")
    }

    private func extractSection(from text: String, sectionName: String) -> String {
        let pattern = "\\*\\*\(sectionName):\\*\\*"

        guard
            let regex = try? NSRegularExpression(pattern: pattern),
            let match = regex.firstMatch(
                in: text,
                range: NSRange(text.startIndex..., in: text)
            ),
            let matchRange = Range(match.range, in: text)
        else {
            return "\(sectionName) not found"
        }

        let startIndex = matchRange.upperBound
        let remainingText = String(text[startIndex...])

        let nextHeaderPattern = "\\*\\*[^*]+:\\*\\*"
        let endIndex: String.Index

        if
            let nextRegex = try? NSRegularExpression(pattern: nextHeaderPattern),
            let nextMatch = nextRegex.firstMatch(
                in: remainingText,
                range: NSRange(remainingText.startIndex..., in: remainingText)
            ),
            let nextRange = Range(nextMatch.range, in: remainingText)
        {
            endIndex = nextRange.lowerBound
        } else {
            endIndex = remainingText.endIndex
        }

        return remainingText[..<endIndex]
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
