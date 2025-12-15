//
//  FunFactsViewModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation
import SwiftUI

@Observable
class FunFactsViewModel {
    
    var funFacts: [FunFactModel] = []
    
    private var seenFactIDs: Set<Int> = []
    
    var funFactsRead: Int {
        get { UserDefaults.standard.integer(forKey: "funFactsRead") }
        set { UserDefaults.standard.set(newValue, forKey: "funFactsRead") }
    }
    
    init() {
        loadFunFacts()
    }
    
    private func loadFunFacts() {
        guard let url = Bundle.main.url(forResource: "funfacts", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(FunFactResponse.self, from: data)
        else {
            print("❌ Error loading funfacts.json")
            return
        }
        
        funFacts = decoded.fun_facts
    }
    
    func markAsRead(_ fact: FunFactModel) {
        guard !seenFactIDs.contains(fact.id) else { return }
        seenFactIDs.insert(fact.id)
        funFactsRead += 1
    }
}
