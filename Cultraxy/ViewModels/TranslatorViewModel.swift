//
//  TranslatorViewModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import Foundation
import Combine

@Observable
class TranslatorViewModel: ObservableObject {
    let apiService = GemAPIService()
    
    var explanationn: String = ""
    var isLoading: Bool = false
    
    func getExplanation(for idiom: String){
        guard !idiom.trimmingCharacters(in: .whitespaces).isEmpty else {
                    explanationn = "Please enter an idiom"
                    return
                }
                
        // Mostrar que está cargando
        isLoading = true
        explanationn = "Loading..."
        
        apiService.explainIdiom(idiom: idiom){ result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let explanation):
                    self.explanationn = explanation.explanation
                    print("Explanation received: \(explanation.explanation)")
                    case .failure(let error):
                    self.explanationn = "Error \(error.localizedDescription)"
                    print("Error fetching idiom: \(error)")
                }

            }
                    }
    }
    
}

