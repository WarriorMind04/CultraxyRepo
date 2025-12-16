//
//  GeminiRespField.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

//
//  GeminiRespField.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct GeminiRespField: View {
    @ObservedObject var transvm: TranslatorViewModel
    @State private var isFlipped = false
    @State private var text: String = "Gemini Response here"
    
    var body: some View {
        ZStack {
            if !isFlipped {
                // Parte frontal de la tarjeta
                CardFront(transvm: transvm)
                    .transition(.identity)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
            } else {
                // Parte trasera de la tarjeta
                CardBack(transvm: transvm)
                    .transition(.identity)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 0 : -180),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isFlipped.toggle()
            }
        }
    }
}

// Vista frontal de la tarjeta
struct CardFront: View {
    @ObservedObject var transvm: TranslatorViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Text("English")
                    .font(.caption)
                    .foregroundColor(Color.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(transvm.literalTranslation)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            // Texto "click to see the context" al final
            Text("Click to see the context")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
        )
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

// Vista trasera de la tarjeta
struct CardBack: View {
    @ObservedObject var transvm: TranslatorViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("English")
                .font(.caption)
                .foregroundColor(Color.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(transvm.context.isEmpty ? "No context available" : transvm.context)
                .font(.body)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
        )
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

#Preview {
    GeminiRespField(transvm: TranslatorViewModel())
}
