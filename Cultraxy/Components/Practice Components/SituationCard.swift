//
//  SituationCard.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import SwiftUI

struct SituationCard: View {
    let scenario: PracticeScenario
    let onRefresh: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                LanguageButtonPractice(text: "English → Spanish (Mexico)")
                Spacer()
                Button(action: onRefresh) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.borde)
                        .imageScale(.large)
                }
            }
            .padding()
            .background(Color.board.opacity(0.13))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            
            Divider()
                
            // Content
            VStack(alignment: .leading, spacing: 16) {
                Text(scenario.scenario)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Target Idiom Box
                VStack(alignment: .leading, spacing: 8) {
                    Text("Target idiom (\(scenario.sourceLanguage.uppercased()))")
                        .font(.caption)
                        .foregroundColor(.secondary.opacity(0.8))
                    
                    Text(scenario.idiom)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.secondary.opacity(0.3))
                .cornerRadius(12)
            }
            .padding()
            .background(Color.board.opacity(0.13))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .background(Color.board.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.borde, lineWidth: 4)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}

