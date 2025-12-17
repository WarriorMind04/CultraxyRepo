//
//  PracticeView.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

/*import SwiftUI

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
        VStack(spacing: 20) {
            
        
            
            // Scenario Text
            // Situation Component
                        SituationCard(
                            scenario: scenario,
                            onRefresh: {
                                viewModel.loadNewPractice(
                                    sourceLanguage: sourceLanguage,
                                    targetLanguage: targetLanguage,
                                    targetCulture: targetCulture
                                )
                            }
                        )
                        
            //Spacer()
                        
                        // Answer Component
                        AnswerCard(
                            userAnswer: $viewModel.userAnswer,
                            isDisabled: viewModel.showingEvaluation,
                            isCheckDisabled: viewModel.userAnswer.isEmpty || viewModel.showingEvaluation,
                            onCheck: {
                                viewModel.checkAnswer()
                            },
                            onHint: {
                                showingHint = true
                            }
                        )
            
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
                .foregroundColor(.borde)
            
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
                    .background(Color.borde)
                    .cornerRadius(12)
            }
        }
        .padding(40)
    }
}

#Preview {
    IdiomPracticeView()
}
*/
import SwiftUI

struct IdiomPracticeView: View {
    @State private var viewModel = IdiomPracticeViewModel()
    @State private var sourceLanguage = "en"
    @State private var targetLanguage = "es"
    @State private var targetCulture = "Mexico"
    @State private var showingHint = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
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
        VStack(spacing: 20) {
            // Situation Component
            SituationCard(
                scenario: scenario,
                onRefresh: {
                    viewModel.loadNewPractice(
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage,
                        targetCulture: targetCulture
                    )
                }
            )
            
            // Answer Component
            AnswerCard(
                userAnswer: $viewModel.userAnswer,
                isDisabled: viewModel.showingEvaluation,
                isCheckDisabled: viewModel.userAnswer.isEmpty || viewModel.showingEvaluation,
                onCheck: {
                    viewModel.checkAnswer()
                },
                onHint: {
                    showingHint = true
                }
            )
            
            // Evaluation Result
            if viewModel.showingEvaluation, let evaluation = viewModel.evaluation {
                EvaluationView(evaluation: evaluation) {
                    viewModel.loadNewPractice(
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage,
                        targetCulture: targetCulture
                    )
                }
            }
        }
        .padding()
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 60))
                .foregroundColor(.borde)
            
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
                    .background(Color.borde)
                    .cornerRadius(12)
            }
        }
        .padding(40)
    }
}

#Preview {
    IdiomPracticeView()
}
