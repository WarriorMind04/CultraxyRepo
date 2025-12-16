//
//  HomeView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var transvm = TranslatorViewModel()
    @State private var showMeaning = true
    @State private var sourceLanguage: Language = .spanish
    @State private var targetLanguage: Language = .english
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                HStack(spacing: 16) {
                    LanguageButton(
                        selectedLanguage: sourceLanguage,
                        onLanguageSelected: { language in
                            sourceLanguage = language
                        }
                    )
                    
                    Button(action: {
                        // Intercambiar idiomas
                        let temp = sourceLanguage
                        sourceLanguage = targetLanguage
                        targetLanguage = temp
                    }) {
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    LanguageButton(
                        selectedLanguage: targetLanguage,
                        onLanguageSelected: { language in
                            targetLanguage = language
                        }
                    )
                }
                .padding(.horizontal)
                .padding(.top, 30)
                .padding(.bottom, 20)

                AppTextFieldView { prompt in
                    transvm.getExplanation(for: prompt)
                }
                .padding()

                GeminiRespField(transvm: transvm)

                HStack(spacing: 12) {
                    ToggleButton(title: "Meaning", isSelected: showMeaning) {
                        showMeaning = true
                    }
                    ToggleButton(title: "Equivalent", isSelected: !showMeaning) {
                        showMeaning = false
                    }
                    Spacer()
                }
                
                .padding(.horizontal)
                .padding(.bottom, 20)

                if showMeaning {
                    Text(transvm.actualMeaning.isEmpty || transvm.actualMeaning == "Loading..."
                         ? ""
                         : transvm.actualMeaning
                    )
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.board.opacity(0.15))
                    )
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                    .animation(.easeInOut, value: transvm.actualMeaning)

                } else {
                    Text(transvm.equivalent.isEmpty || transvm.equivalent == "Loading..."
                         ? ""
                         : transvm.equivalent
                    )
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.board.opacity(0.15))
                    )
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                    .animation(.easeInOut, value: transvm.equivalent)
                }

                // Espaciado adicional al final para evitar superposición con el tab bar
                Color.clear.frame(height: 20)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.board.opacity(0.05))
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .contentShape(Rectangle())
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
#endif

#Preview {
    HomeView()
}
