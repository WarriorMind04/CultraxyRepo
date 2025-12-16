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
        VStack(spacing: 0) {
            // Header simple
            
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "lightbulb.fill")
                        .font(.subheadline)
                        .foregroundColor(Color.board)
                    
                    Text(fact.culture)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text("\(readCount) reads")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Contenido principal - centrado verticalmente
            VStack(spacing: 20) {
                Text(fact.text)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 24)
            }
            .frame(maxHeight: .infinity)
            
            // Botón de compartir y footer pegados al fondo
            VStack(spacing: 12) {
                Button {
                    shareFact(fact.text)
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.caption)
                        Text("Share")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.board)
                    .cornerRadius(20)
                }
                
                Text("Swipe for more →")
                    .font(.caption)
                    .foregroundColor(.gray.opacity(0.9))
                    .padding(.bottom, 20)
            }
        }
        .frame(height: 550)
        .background(Color.board.opacity(0.13))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal, 30)
    }
    
    private func shareFact(_ text: String) {
        let av = UIActivityViewController(
            activityItems: ["💡 Fun Fact\n\n\(text)\n\n📚 Culture: \(fact.culture)"],
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


#Preview {
    FunFactCard(
        fact: FunFactModel(
            id: 1,
            text: "Los árboles pueden comunicarse entre sí a través de una red de hongos subterráneos",
            culture: "Ciencia",
            source: "Naturaleza"
        ),
        readCount: 42
    )
}
