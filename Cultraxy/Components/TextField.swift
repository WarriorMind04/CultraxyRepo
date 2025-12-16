//
//  TextField.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct AppTextFieldView: View {
    @State private var text: String = ""
    var onSubmit: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Spanish")
                .font(.caption)
                .foregroundColor(Color.text)

            HStack(alignment: .bottom, spacing: 12) {
                TextField("Write your cultural question here...", text: $text, axis: .vertical)
                    .lineLimit(1...)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                    guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                    onSubmit(text)
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title2)
                        .foregroundColor(
                            text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                            ? .gray
                            : .board
                        )
                }
                .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.board.opacity(0.15))
        )
        
        
    }
}


#Preview {
    AppTextFieldView { prompt in
        print("You typed: \(prompt)")
    }
}
