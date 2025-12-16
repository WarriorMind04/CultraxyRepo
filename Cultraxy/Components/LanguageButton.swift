//
//  LanguageButton.swift
//  GrootApp
//
//  Created by Estrella Verdiguel on 15/12/25.
//

import SwiftUI


struct LanguageButton: View {
    let selectedLanguage: Language
    let onLanguageSelected: (Language) -> Void
    @State private var showLanguagePicker = false

    var body: some View {
        Button(action: {
            showLanguagePicker = true
        }) {
            HStack(spacing: 8) {
                Text(selectedLanguage.flag)
                    .font(.title3)
                Text(selectedLanguage.name)
                    .font(.body)
                    .fontWeight(.medium)
                Image(systemName: "chevron.down")
                    .font(.caption)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.board.opacity(0.15))
            )
        }
        .foregroundColor(.primary)
        .sheet(isPresented: $showLanguagePicker) {
            LanguagePickerView(
                selectedLanguage: selectedLanguage,
                onSelect: { language in
                    onLanguageSelected(language)
                    showLanguagePicker = false
                }
            )
        }
    }
}

struct LanguagePickerView: View {
    let selectedLanguage: Language
    let onSelect: (Language) -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            List(Language.allLanguages) { language in
                Button(action: {
                    onSelect(language)
                }) {
                    HStack {
                        Text(language.flag)
                            .font(.title2)
                        Text(language.name)
                            .font(.body)
                        Spacer()
                        if language.code == selectedLanguage.code {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                                .fontWeight(.semibold)
                        }
                    }
                    .contentShape(Rectangle())
                }
                .foregroundColor(.primary)
            }
            .navigationTitle("Select Language")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    LanguageButton(
        selectedLanguage: .spanish,
        onLanguageSelected: { _ in }
    )
}
