//
//  GemAPIService.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import Foundation

class GemAPIService {
    private let baseURL = "https://backend-we-are-groot-69intvibp-jose-miguels-projects-4169b721.vercel.app/"
    
    //Matching the functionality of the explain idiom endpoint
    func explainIdiom(idiom: String, completion: @escaping (Result<IdiomExplanation, NetworkError>) -> Void) {
        
        // Construct the URL and request
        guard let url = URL(string: baseURL + "/explain_idiom") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Encode the request body in order to match what flask expects
        let requestBody = ["idiom": idiom]
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            //completion(.failure(.encodingError))
            return
        }
        
        urlRequest.httpBody = httpBody
        
        //Start the network task
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                //Decoding the response data -> transforming the json data to normal data
                do{
                    let decoder = JSONDecoder()
                    let explanation = try decoder.decode(IdiomExplanation.self, from: data)
                    completion(.success(explanation))
                } catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        .resume()
        
    }
        
    
    
}
