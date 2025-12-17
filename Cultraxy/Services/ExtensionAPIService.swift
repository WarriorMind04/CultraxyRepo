//
//  ExtensionAPIService.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import Foundation

extension GemAPIService {
    
    /// Genera un nuevo escenario de práctica
    func generatePractice(
        sourceLanguage: String,
        targetLanguage: String,
        targetCulture: String,
        completion: @escaping (Result<PracticeScenario, NetworkError>) -> Void
    ) {
        guard let url = URL(string: baseURL + "/practice/generate") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // ✅ NECESARIOS PARA LOCALTUNNEL/VERCEL
        urlRequest.setValue("localtunnel", forHTTPHeaderField: "User-Agent")
        urlRequest.setValue("true", forHTTPHeaderField: "bypass-tunnel-reminder")
        
        let requestBody: [String: String] = [
            "source_language": sourceLanguage,
            "target_language": targetLanguage,
            "target_culture": targetCulture
        ]
        
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            completion(.failure(.encodingError))
            return
        }
        
        urlRequest.httpBody = httpBody
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ Network error:", error.localizedDescription)
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                // Debug: imprime la respuesta
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📥 Practice response:", jsonString)
                }
                
                do {
                    let scenario = try JSONDecoder().decode(PracticeScenario.self, from: data)
                    completion(.success(scenario))
                } catch {
                    print("❌ Decoding error:", error.localizedDescription)
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        .resume()
    }
    
    /// Evalúa la respuesta del usuario
    func evaluateAnswer(
        practiceId: String,
        userAnswer: String,
        idiom: String,
        sourceLanguage: String,
        targetLanguage: String,
        completion: @escaping (Result<PracticeEvaluation, NetworkError>) -> Void
    ) {
        guard let url = URL(string: baseURL + "/practice/evaluate") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // ✅ NECESARIOS PARA LOCALTUNNEL/VERCEL
        urlRequest.setValue("localtunnel", forHTTPHeaderField: "User-Agent")
        urlRequest.setValue("true", forHTTPHeaderField: "bypass-tunnel-reminder")
        
        let requestBody: [String: String] = [
            "practice_id": practiceId,
            "user_answer": userAnswer,
            "idiom": idiom,
            "source_language": sourceLanguage,
            "target_language": targetLanguage
        ]
        
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            completion(.failure(.encodingError))
            return
        }
        
        urlRequest.httpBody = httpBody
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ Network error:", error.localizedDescription)
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                // Debug: imprime la respuesta
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📥 Evaluation response:", jsonString)
                }
                
                do {
                    let evaluation = try JSONDecoder().decode(PracticeEvaluation.self, from: data)
                    completion(.success(evaluation))
                } catch {
                    print("❌ Decoding error:", error.localizedDescription)
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        .resume()
    }
}
