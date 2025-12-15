//
//  FlashCards.swift
//  Cultra
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//

import SwiftUI



struct FlashCards: View {
    @State private var flipped = false
    @State private var rotation = 0.0
    var body: some View {
        ZStack{
            Group{
                if rotation < 90{
                    FrontCard()
                } else {
                    BackCard()
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
            }
            .frame(width: 350, height: 580)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 4)
                        )
                        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                    }
                    .onTapGesture {
                        if rotation > 170{
                            resetCard()
                        } else {
                            flipCard()
                        }
                        
                    }
        }
    // MARK: - Flip Animation
        private func flipCard() {
            withAnimation(.easeInOut(duration: 0.6)) {
                rotation += 180
            }
            flipped.toggle()
        }
        
        private func resetCard() {
            withAnimation(.easeInOut(duration: 0.6)) {
                rotation -= 180
            }
            flipped.toggle()
            rotation = 0
    }
        
        
    
}

#Preview {
    FlashCards()
}
