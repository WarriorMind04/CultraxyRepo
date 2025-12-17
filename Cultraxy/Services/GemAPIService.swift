//
//  GemAPIService.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//



import Foundation

class GemAPIService {

    let baseURL = "https://backend-cultraxy-bc30zuwik-jose-miguels-projects-4169b721.vercel.app/"

    /// Llama al backend para explicar un idiom en el idioma seleccionado
    func explainIdiom(
        idiom: String,
        languageCode: String,
        completion: @escaping (Result<IdiomExplanation, NetworkError>) -> Void
    ) {

        guard let url = URL(string: baseURL + "/explain_idiom") else {
            completion(.failure(.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // ✅ NECESARIOS PARA LOCALTUNNEL
        urlRequest.setValue("localtunnel", forHTTPHeaderField: "User-Agent")
        urlRequest.setValue("true", forHTTPHeaderField: "bypass-tunnel-reminder")

        // 🔹 BODY CON IDIOM + IDIOMA
        let requestBody: [String: String] = [
            "idiom": idiom,
            "language": languageCode
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

                do {
                    let explanation = try JSONDecoder().decode(IdiomExplanation.self, from: data)
                    completion(.success(explanation))
                } catch {
                    print("❌ Decoding error:", error.localizedDescription)
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        .resume()
    }
}
