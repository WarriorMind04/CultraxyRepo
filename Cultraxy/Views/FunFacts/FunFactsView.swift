//
//  FavsView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct FunFactsView: View {
    @State private var viewModel = FunFactsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.funFacts) { fact in
                            FunFactCard(
                                fact: fact,
                                readCount: viewModel.funFactsRead
                            )
                            .frame(height: UIScreen.main.bounds.height)
                            .onAppear {
                                viewModel.markAsRead(fact)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea()
        }
        
        
}

#Preview {
    FunFactsView()
}
