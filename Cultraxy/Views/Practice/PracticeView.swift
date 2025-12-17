//
//  PracticeView.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import SwiftUI

struct IdiomPracticeView: View {
    @State private var viewModel = IdiomPracticeViewModel()
    @State private var sourceLanguage = "en"
    @State private var targetLanguage = "es"
    @State private var targetCulture = "Mexico"
    @State private var showingHint = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack() {
                        // Header
                        
                        
                        // Language selector
                        /*HStack(spacing: 12) {
                            LanguageButtonPractice(text: "English → Spanish (Mexico)")
                            LanguageButtonPractice(text: "Intermediate")
                        }
                        .padding(.horizontal)*/
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .scaleEffect(1.5)
                                .padding(40)
                        } else if let scenario = viewModel.currentScenario {
                            practiceCard(scenario: scenario)
                        } else {
                            emptyStateView
                        }
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.loadNewPractice(
                sourceLanguage: sourceLanguage,
                targetLanguage: targetLanguage,
                targetCulture: targetCulture
            )
        }
        .alert("Hint", isPresented: $showingHint) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.getHint())
        }
    }
    
    // MARK: - Practice Card
    @ViewBuilder
    private func practiceCard(scenario: PracticeScenario) -> some View {
        VStack(spacing: 0) {
            // Situation Header
            HStack {
                /*Text("Situation")
                    .font(.headline)*/
                LanguageButtonPractice(text: "English → Spanish (Mexico)")
                Spacer()
                Button(action: {
                    viewModel.loadNewPractice(
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage,
                        targetCulture: targetCulture
                    )
                }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.borde)
                        .imageScale(.large)
                }
            }
            .padding()
            .background(Color.board)
            
            Divider()
            
            // Scenario Text
            VStack(alignment: .leading, spacing: 16) {
                Text(scenario.scenario)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Target Idiom
                VStack(alignment: .leading, spacing: 8) {
                    Text("Target idiom (\(scenario.sourceLanguage.uppercased()))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(scenario.idiom)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
            .padding()
            .background(Color.board)
            
            //Divider()
            Spacer()
            Spacer()
            
            // Answer Section
            VStack(alignment: .leading, spacing: 12) {
                Text("Your Answer")
                    .font(.headline)
                
                TextField("Escribe tu respuesta...", text: $viewModel.userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(viewModel.showingEvaluation)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                // Buttons
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.checkAnswer()
                    }) {
                        Text("Check")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.userAnswer.isEmpty ? Color.gray : Color.blue)
                            .cornerRadius(12)
                    }
                    .disabled(viewModel.userAnswer.isEmpty || viewModel.showingEvaluation)
                    
                    Button(action: {
                        showingHint = true
                    }) {
                        Text("Hint")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(12)
                    }
                    .disabled(viewModel.showingEvaluation)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            
            // Evaluation Result
            if viewModel.showingEvaluation, let evaluation = viewModel.evaluation {
                Divider()
                
                EvaluationView(evaluation: evaluation) {
                    viewModel.loadNewPractice(
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage,
                        targetCulture: targetCulture
                    )
                }
                .padding()
                .background(Color(.systemBackground))
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        .padding()
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 60))
                .foregroundColor(.secondary)
            
            Text("Ready to practice?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Tap the button below to start")
                .foregroundColor(.secondary)
            
            Button(action: {
                viewModel.loadNewPractice(
                    sourceLanguage: sourceLanguage,
                    targetLanguage: targetLanguage,
                    targetCulture: targetCulture
                )
            }) {
                Text("Start Practice")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 200)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding(40)
    }
}

#Preview {
    IdiomPracticeView()
}
