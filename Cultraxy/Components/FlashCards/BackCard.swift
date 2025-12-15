//
//  BackCard.swift
//  Cultra
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//

import SwiftUI

struct BackCard: View {
    
    @State private var viewModel = BackCardViewModel()
    var body: some View {
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .frame(width: 300, height: 300)
                        .foregroundColor(colorForType)
                        .opacity(0.3)
                    
                    VStack{
                        Text(viewModel.currentContent?.title ?? "")
                            .font(.largeTitle)
                            .foregroundStyle(Color.black)
                        Text(viewModel.currentContent?.text ?? "")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.black)
                            .padding(.horizontal)
                        
                    }
                    
                }
                
            }
            .onAppear {
                        viewModel.randomize()
                    }
        }
    private var colorForType: Color {
            switch viewModel.currentContent?.type {
            case .challenge:
                return .blue
            case .funFact:
                return .green
            case .suggestion:
                return .orange
            default:
                return .gray
            }
        }
}

#Preview {
    BackCard()
}
