//
//  BackCardViewModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

@Observable
class BackCardViewModel {
    
    var currentContent: BackCardContent?
    private(set) var contents: [BackCardContent] = []
    
    init() {
        loadData()
    }
   
    
    private func loadData() {
        guard let url = Bundle.main.url(forResource: "flashcarddata", withExtension: "json") else {
                print("❌ JSON file not found")
                return
            }

            do {
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode([BackCardContent].self, from: data)
                contents = decoded
                currentContent = contents.randomElement()
                print("✅ Loaded \(contents.count) cards")
            } catch {
                print("❌ Error decoding JSON:", error)
            }
    }
    
    func randomize() {
        currentContent = contents.randomElement()
    }
}
