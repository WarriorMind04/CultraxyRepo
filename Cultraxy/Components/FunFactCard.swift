//
//  FunFactCard.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import SwiftUI

struct FunFactCard: View {
    
    let fact: FunFactModel
    let readCount: Int
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gray],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                Spacer()
                
                Text(fact.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                
                Spacer()
                
                HStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        Text("Culture: \(fact.culture)")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("Read: \(readCount)")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    //Spacer()
                    
                    Button {
                        shareFact(fact.text)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.bottom, 82)
            }
        }
    }
    
    private func shareFact(_ text: String) {
        let av = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )
        UIApplication.shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .rootViewController?
            .present(av, animated: true)
    }
}
