//
//  AnswerCard.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import SwiftUI

struct AnswerCard: View {
    @Binding var userAnswer: String
    let isDisabled: Bool
    let isCheckDisabled: Bool
    let onCheck: () -> Void
    let onHint: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your Answer")
                .font(.headline)
            
            TextField("Escribe tu respuesta...", text: $userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(isDisabled)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Spacer()
            // Buttons
            HStack(spacing: 12) {
                Button(action: onCheck) {
                    Text("Check")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.board)
                        .cornerRadius(12)
                }
                .disabled(isCheckDisabled)
                
                Button(action: onHint) {
                    Text("Hint")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                }
                .disabled(isDisabled)
            }
        }
        .padding()
        //.background(Color(.systemBackground))
        //.cornerRadius(16)
        //.shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}
