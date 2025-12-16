//
//  ToggleButton.swift
//  GrootApp
//
//  Created by Estrella Verdiguel on 15/12/25.
//

import SwiftUI

struct ToggleButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSelected ? Color.board : Color.board.opacity(0.15))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
    }
}

#Preview {
    HStack(spacing: 12) {
            ToggleButton(title: "Meaning", isSelected: true) {}
            ToggleButton(title: "Equivalent", isSelected: false) {}
        }
        .padding()
}
