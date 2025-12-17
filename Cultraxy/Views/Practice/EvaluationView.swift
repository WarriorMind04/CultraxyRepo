//
//  EvaluationView.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import SwiftUI

struct EvaluationView: View {
    let evaluation: PracticeEvaluation
    let onNext: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: evaluation.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(evaluation.isCorrect ? .green : .orange)
                    .font(.title2)
                
                Text(evaluation.isCorrect ? "Good job!" : "Not quite!")
                    .font(.headline)
                    .foregroundColor(evaluation.isCorrect ? .green : .orange)
                
                Spacer()
                
                Text("\(evaluation.score)%")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            
            Text(evaluation.feedback)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            
            if !evaluation.isCorrect {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Possible answers:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    HStack(alignment: .top, spacing: 8) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                            .padding(.top, 6)
                        Text(evaluation.correctAnswer)
                            .font(.body)
                    }
                }
                .padding(.top, 8)
            }
            
            Button(action: onNext) {
                HStack {
                    Text("Next Practice")
                    Image(systemName: "arrow.right")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.borde)
                .cornerRadius(12)
            }
            .padding(.top, 8)
        }
        .padding()
        .background(evaluation.isCorrect ? Color.green.opacity(0.1) : Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
}

