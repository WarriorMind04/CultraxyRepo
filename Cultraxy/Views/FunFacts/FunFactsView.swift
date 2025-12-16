//
//  FunFactsView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct FunFactsView: View {
    @State private var viewModel = FunFactsViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(viewModel.funFacts) { fact in
                    FunFactCard(
                        fact: fact,
                        readCount: viewModel.funFactsRead
                    )
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .onAppear {
                        viewModel.markAsRead(fact)
                    }
                }
            }
        }
        .background(Color.board.opacity(0.05))
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 10)
        }
    }
}

#Preview {
    FunFactsView()
}
